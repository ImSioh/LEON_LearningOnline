<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/teacher/template/header.jsp"/>
<div class="container pt-5">
    <style>
        #class_picture_preview {
            height: 0;
            background-position: center;
            background-size: cover;
            border-radius: 0.5rem;
        }

        .error {
            display: block;
            color: red;
        }
    </style>
    <h1 class="display-4 fw-bold text-center pb-4 pt-5">Create class</h1>
    <form id="create-class" class="p-4 p-md-5 border rounded-3 bg-light" method="POST" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="name" class="form-label">Class name</label>
            <input type="text" class="form-control" name="name" id="name">
            <label id="name-error" class="error mt-1" for="name">${requestScope["name-error"]}</label>
        </div>
        <div id="class_picture_preview"></div>
        <div class="mb-3 mt-2">
            <label for="class_picture" class="form-label">Add class picture</label>
            <input type="file" class="form-control" name="class_picture" id="class_picture"
                   accept="image/png, image/jpeg">
            <label id="class_picture-error" class="error mt-1" for="class_picture">${requestScope["class_picture-error"]}</label>
        </div>
        <div class="form-check form-switch pt-2">
            <input class="form-check-input" type="checkbox" id="enroll_approve" name="enroll_approve" checked>
            <label class="form-check-label" for="enroll_approve">Require approval</label>
        </div>
        <button class="w-100 mt-4 btn btn-lg btn-primary" type="submit">Create class</button>
    </form>
    <script>
        const pictureInput = document.getElementById('class_picture')
        const previewElement = document.getElementById('class_picture_preview')
        const previewErrorElement = document.getElementById('class_picture-error')
        console.log(pictureInput, previewElement);
        pictureInput.addEventListener('change', event => {
            const file = event.target.files[0]
            if (!file || file.size > 5 * 1024 * 1024) {
                previewElement.style.backgroundImage = null
                previewElement.style.paddingTop = null
                return
            }
            previewErrorElement.textContent = ''
            const localUrl = `url("` + URL.createObjectURL(file) + `")`
            previewElement.style.backgroundImage = localUrl
            previewElement.style.paddingTop = '40%'
        })
        $(document).ready(function () {
            $.validator.addMethod('filesize', function (value, element, param) {
                return this.optional(element) || (element.files[0].size <= param)
            }, 'File size must be less than 5 Mb');
            $('#create-class').validate({
                rules: {
                    name: {
                        required: true
                    },
                    'class_picture': {
                        filesize: 5 * 1024 * 1024
                    }
                },
                messages: {
                    name: {
                        required: 'Please enter class name'
                    }
                }
            })
        })
    </script>
</div>
<c:import url="/teacher/template/footer.jsp"/>