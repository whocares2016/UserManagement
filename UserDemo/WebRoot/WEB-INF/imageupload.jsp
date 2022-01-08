<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2022/1/8
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form id="orgLogoAddrUploadForm" method="post" target="upload_result"
          action="${webRoot}/articlePush/uploadImage" class="form-horizontal col-sm-12 form"
          style="margin-left: 0;  display: none;" enctype="Multipart/form-data">
        <div class="form-group" style="margin-bottom: 0;">
            <div id="thumbnailUploadContainer" class="col-sm-10">
                <span style="font-weight: bolder;">图片上传：</span>
                <input id="orgLogoAddrImageFile" name="imageFile" type="file" class="form-
                          control" style="width: 180px; display: inline;" />
                <button id="uploadButton" class="btn btn-primary" type="button">上传图片 </button>
                <span style="color:red;">*</span>
            </div>
        </div>
    </form>


    <script>
        // 图片上传按钮
        $("#uploadButton").on("click", function() {
            var image = $("#orgLogoAddrImageFile").val();
            if (image==null || image.length<=0) {
                alert("请选中上传的图片!");
                return;
            }
            $("#orgLogoAddrUploadForm").submit();

        });
    </script>


</body>
</html>
