<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.jspsmart.upload.SmartUpload" %>
 <%@ page import="java.util.Date" %>
 <% String path = request.getContextPath(); %>
 <%
String newFile1Name = null;
String file_name = null;

SmartUpload mySmartUpload = new SmartUpload();

//初始化上传
mySmartUpload.initialize(pageContext);

//只允许上载此类文件
try {
    //mySmartUpload.setAllowedFilesList("jpg,Jpg,JPG,GIF,gif,Gif,png");
    mySmartUpload.upload();
} catch (Exception e) {
    //out.println("<script language=javascript>alert('上传格式错误！');   history.back(-1);</script>");
    //return;
}

try {
    com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
    if (myFile.isMissing()) {
        out.println("<script language=javascript>alert('必须选择图片！');   history.back(-1);</script>");
        return;
    } else {
        int file_size = myFile.getSize(); //取得文件的大小 (单位是b)
        file_name = myFile.getFileName();
        System.out.println("文件大小：" + file_size + "文件名称：" + file_name);
        //if (file_size > 10*1024*1024)
        //{
        //out.println("<script language=javascript>alert('上传图片大小应控制在10K~1M之间！');   history.back(-1);</script>");
        //return;
        //}
        //else
        //{
        newFile1Name = new Date().getTime() + file_name.substring(file_name.indexOf("."));
        System.out.println("新文件名称：" + newFile1Name);

        String saveurl = request.getSession(true).getServletContext().getRealPath("/") + "upload";

        saveurl = saveurl + "/" + newFile1Name;
        myFile.saveAs(saveurl, mySmartUpload.SAVE_PHYSICAL);
        // }
    }
} catch (Exception e) {
    e.toString();
}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <script src="js/jquery.js"></script>
    <meta charset="utf-8" />
    <title>上传文件</title>
    <script language="javascript">
        function check() {
            if (document.formAdd.fujian.value == "") {
                alert("请选择文件");
                return false;
            }
            return true;
        }
    </script>

    <script>
        /**
         * 获取剪贴板中的图片
         * @param e event事件
         * @returns {any}
         */
        function getPasteImage(e) {
            var ret = false;
            if (e.clipboardData && e.clipboardData.items) {
                for (var i = 0; i < e.clipboardData.items.length; i++) {
                    if (/^image\//.test(e.clipboardData.items[i].type)) {
                        ret = true;
                        break;
                    }
                }
            }
            return ret ? e.clipboardData.items : null;
        }

        /**
         * 获取拖动的文件
         * @param e 事件
         * @returns {any}
         */
        function getDropImage(e) {
            return e.dataTransfer && e.dataTransfer.files ? e.dataTransfer.files : null;
        }

        /**
         * ajax方式发送文件
         * @param file
         */
        function sendAndInsertImage(file) {
            //构建模拟数据
            var fd = new FormData();
            //  设置fujian 文件
            fd.append("fujian", file, file.name || "blob." + file.type.substr("image/".length));
            //  设置 类型为 ajax
            fd.append("type", "ajax");
            // 创建ajax 对象
            var xhr = new XMLHttpRequest();

            // 设置为post 提交
            xhr.open("post", $("#uploadForm").attr("action"), true);
            // 设置提交头
            xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");

            // 加载完成后，返回数据
            xhr.addEventListener("load", function (e) {
                try {
                    // 将结果写入 body 中
                    var data = e.target.response;
                    $("body").html(data);
                } catch (er) {}
            });
            xhr.send(fd);
        }

        /**
         * 获取url 参数
         * @param name
         * @returns {string|null}
         * @constructor
         */
        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]);
            return null;
        }

        $(function () {
            var urlParam = "";
            // 获取result 参数 不为null
            if (GetQueryString("result")) {
                // 设置成功上传后提交这个文件
                urlParam += "Result=" + GetQueryString("result");
            } else {
                // 设置成功上传后提交这个文件
                urlParam += "callback=" + GetQueryString("callback");
            }
            // 设置form 表单提交路径
            document.getElementById("uploadForm").setAttribute("action", "./upload_re.jsp?" + urlParam);

            // 检测是否支持html5方式上传
            if (window.FormData && window.FileReader) {
                // 支持则显示下面的文字
                $("#copyUpload").show();

                // 监听拖拽事件和 粘贴事件
                $("#copyUpload").on("dragover drop paste", function (e) {
                    if (e.type == "dragover")
                        if (e.originalEvent.dataTransfer.types[0] == "Files") {
                            e.preventDefault();
                            return false;
                        }
                    e.preventDefault();
                    var hasImg = true,
                        items;

                    //获取粘贴板文件列表或者拖放文件列表
                    items = e.type == "paste" ? getPasteImage(e.originalEvent) : getDropImage(e.originalEvent);
                    console.log(items);
                    if (items) {
                        var len = items.length,
                            file;

                        // 将获取到的数据 使用ajax 方式提交给后台
                        while (len--) {
                            hasImg = true;
                            file = items[len];
                            if (file.getAsFile) file = file.getAsFile();
                            if (file && file.type && /^image\//.test(file.type) && file.size > 0) {
                                sendAndInsertImage(file);
                                hasImg = true;
                            }
                        }
                    }
                });
            }
        });
    </script>
</head>

<body>
<form id="uploadForm" action="javascript:;" name="formAdd" method="post" enctype="multipart/form-data">
    <input type="file" name="fujian" id="fujian" onKeyDown="javascript:alert('此信息不能手动输入');return false;" />
    <input type="submit" value="提交" onClick="return check()" />
</form>
<div id="copyUpload" style="display: none" contenteditable="true" readonly="readonly">点我 Ctrl + v 上传截图，不懂截图？按Ctrl+Alt+A或者Alt+A进行截图</div>
</body>
</html>



<script language="javascript">
    function Get(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
    }
    var str = location.toString();
    var file = "upload/<%= newFile1Name %>";
    var Result = Get("Result");
    var callback = Get("callback");
    if (Result != null) {
        window.parent.document.getElementById(Result).value = file;
    } else {
        window.parent.window[callback](file);
    }
    document.write("上传成功");
    /*

    var str=location.toString()
    var Result=((((str.split('?'))[1]).split('='))[1]);
	//window.opener.Form1(Result).focus();	
	window.parent.document.getElementById(Result).value="upload/<%= newFile1Name %>";					

    
	//window.opener=null;
	document.write("上传成功");
    //window.close();
*/
</script>
