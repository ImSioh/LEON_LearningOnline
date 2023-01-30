<%-- 
    Document   : index
    Created on : Jan 30, 2023, 4:42:31 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp" %>

<div id="content">
    <h1>Feedbacks Management</h1>
    <!-- <img src="assets/img/welcome_admin.jpg" alt="Welcome to Admin Homepage" width="100%" height="100%" style="margin: 0;"/> -->
    <form action="" style="padding-top: 3%;">
        <!-- <span class="button-action" style="">
            <span class="input-action form-outline form-control sort" style="width: 25%;">
                <select class="form-select" aria-label="Default select example">
                    <option selected>Open this select menu</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                  </select>
                 <input type="text" name="" id="" class="form-control"> -->
        <!-- <label class="form-label" for="">Sort</label> -->
        <!-- </span>
        <input type="submit" value="Sort" class="btn btn-info">
    </span> --> 
        <span class="button-action" style="">
            <span class="input-action form-outline form-control" style="width: 25%;">
                <input type="text" name="" id="" class="form-control">
                <label class="form-label" for="">Search...</label>
            </span>
            <input type="submit" value="Search" class="btn btn-info">
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
                    <th>SubmitTime</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Student</td>
                    <td>Login error</td>
                    <td>Can't login by google</td>
                    <td>01/01/1990 00:00</td>
                    <td>Not resolved</td>
                </tr>
                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Teacher</td>
                    <td>Class error</td>
                    <td>Can't create a class</td>
                    <td>01/01/1990 00:00</td>
                    <td>Solving</td>
                </tr>
                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Student</td>
                    <td>Login error</td>
                    <td>Can't login by google</td>
                    <td>01/01/1990 00:00</td>
                    <td>Solved</td>
                </tr>
                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Teacher</td>
                    <td>Class error</td>
                    <td>Can't create a class</td>
                    <td>01/01/1990 00:00</td>
                    <td>Solving</td>
                </tr>
                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Student</td>
                    <td>Login error</td>
                    <td>Can't login by google</td>
                    <td>01/01/1990 00:00</td>
                    <td>Solved</td>
                </tr>
                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Teacher</td>
                    <td>Class error</td>
                    <td>Can't create a class</td>
                    <td>01/01/1990 00:00</td>
                    <td>Solved</td>
                </tr>
<!--                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Student</td>
                    <td>Login error</td>
                    <td>Can't login by google</td>
                    <td>01/01/1990 00:00</td>
                    <td>Solved</td>
                </tr>-->
<!--                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Teacher</td>
                    <td>Class error</td>
                    <td>Can't create a class</td>
                    <td>01/01/1990 00:00</td>
                    <td>Solved</td>
                </tr>-->
<!--                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Student</td>
                    <td>Login error</td>
                    <td>Can't login by google</td>
                    <td>01/01/1990 00:00</td>
                    <td>Not resolved</td>
                </tr>-->
<!--                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Teacher</td>
                    <td>Class error</td>
                    <td>Can't create a class</td>
                    <td>01/01/1990 00:00</td>
                    <td>Solving</td>
                </tr>
                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Student</td>
                    <td>Login error</td>
                    <td>Can't login by google</td>
                    <td>01/01/1990 00:00</td>
                    <td>Solved</td>
                </tr>
                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Teacher</td>
                    <td>Class error</td>
                    <td>Can't create a class</td>
                    <td>01/01/1990 00:00</td>
                    <td>Solving</td>
                </tr>-->
<!--                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Student</td>
                    <td>Login error</td>
                    <td>Can't login by google</td>
                    <td>01/01/1990 00:00</td>
                    <td>Solved</td>
                </tr>
                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Teacher</td>
                    <td>Class error</td>
                    <td>Can't create a class</td>
                    <td>01/01/1990 00:00</td>
                    <td>Solved</td>
                </tr>
                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Student</td>
                    <td>Login error</td>
                    <td>Can't login by google</td>
                    <td>01/01/1990 00:00</td>
                    <td>Solved</td>
                </tr>
                <tr>
                    <td>ABCDE</td>
                    <td>12345</td>
                    <td>Teacher</td>
                    <td>Class error</td>
                    <td>Can't create a class</td>
                    <td>01/01/1990 00:00</td>
                    <td>Solved</td>
                </tr>-->
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
