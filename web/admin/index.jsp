<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp" %>

<div id="content">
    <h1>Feedbacks Management</h1>
    <!-- <img src="assets/img/welcome_admin.jpg" alt="Welcome to Admin Homepage" width="100%" height="100%" style="margin: 0;"/> -->
    <form action="" method="" style="padding-top: 3%;">
        <span class="button-action" style="display: flex;">
            <select class="form-select" style="width: 15%; margin: 32px 0; text-align: center">
                <option selected><-- Select option --></option>
                <option value="1">ID</option>
                <option value="2">Name</option>
                <option value="3">Email</option>
            </select>
            <input type="text" name="" id="" class="form-control" placeholder="Search..." style="width: 45%; margin: 32px"> 
            <input type="submit" value="SEARCH" id="search" class="btn-info" 
                   style="margin: 32px 0 32px 25%; width: 10%; border-radius: 0.25em!important; border: 1px solid #e3f2fd !important;">
        </span>
    </form>
    <div class="table">
        <table class="table table-light table-hover">
            <thead>
                <tr>
                    <th>FeedbackID</th>
                    <th>AccountID</th>
                    <th>Role</th>
                    <th>Title</th>
                    <th>Content</th>
                    <th>Response</th>
                    <th>SubmitTime</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Student</td>
                    <td>Login error</td>
                    <td>Can't login by google</td>
                    <td>Try logging in another way</td>
                    <td>01/01/1990 00:00</td>
                </tr>
                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Teacher</td>
                    <td>Class error</td>
                    <td>Can't create a class</td>
                    <td>The class may have been duplicated</td>
                    <td>01/01/1990 00:00</td>
                </tr>
                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Student</td>
                    <td>Login error</td>
                    <td>Can't login by google</td>
                    <td>Try logging in another way</td>
                    <td>01/01/1990 00:00</td>
                </tr>
                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Teacher</td>
                    <td>Class error</td>
                    <td>Can't create a class</td>
                    <td>The class may have been duplicated</td>
                    <td>01/01/1990 00:00</td>
                </tr>
                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Student</td>
                    <td>Login error</td>
                    <td>Can't login by google</td>
                    <td>The class may have been duplicated</td>
                    <td>01/01/1990 00:00</td>
                </tr>
                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Teacher</td>
                    <td>Class error</td>
                    <td>Can't create a class</td>
                    <td>The class may have been duplicated</td>
                    <td>01/01/1990 00:00</td>
                </tr>
            </tbody>
        </table>
    </div>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-end">
            <li class="page-item disabled">
                <a class="page-link">Previous</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#">Next</a>
            </li>
        </ul>
    </nav>
</div>

<%@include file="template/footer.jsp" %>
