<%-- 
    Document   : manageT
    Created on : Jan 30, 2023, 4:42:52 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp" %>

<div id="content">
    <h1>Teachers Management</h1>
    <!-- <img src="assets/img/welcome_admin.jpg" alt="Welcome to Admin Homepage" width="100%" height="100%" style="margin: 0;"/> -->
    <form action="" style="padding-top: 3%;">
        <span class="button-action" style="display: flex;">
            <select class="form-select" aria-label="Default select example" style="width: 25%; margin: 32px 0; text-align: center">
                    <option selected><-- Select search option --></option>
                    <option value="1">ID</option>
                    <option value="2">Name</option>
                    <option value="3">Email</option>
                </select>
            <input type="text" name="" id="" class="form-control" placeholder="Search..." style="width: 65%; margin: 32px"> 
            <input type="submit" value="Search" class="btn btn-info" style="margin: 10px; margin: 32px 0px; width: 10%">
        </span>
    </form>
    <div class="table">
        <table class="table table-light table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Birthdate</th>
                    <th>Address</th>
                    <th>PhoneNumber</th>
                    <th>CreateTime</th>
                    <th>Locked</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>12345</td>
                    <td>Tiger Nixon</td>
                    <td>2011/04/25</td>
                    <td>Edinburgh</td>
                    <td>0987654321</td>
                    <td>01/01/1990</td>
                    <td><a href="#"><i class="fa-solid fa-lock-open"></i></a></td>
                </tr>
                <tr>
                    <td>12345</td>
                    <td>Cara Stevens</td>
                    <td>2011/12/06</td>
                    <td>New York</td>
                    <td>0987654321</td>
                    <td>01/01/1990</td>
                    <td><a href="#"><i class="fa-solid fa-lock"></i></a></td>
                </tr>
                <tr>
                    <td>12345</td>
                    <td>Hermione Butler</td>
                    <td>2011/03/21</td>
                    <td>London</td>
                    <td>0987654321</td>
                    <td>01/01/1990</td>
                    <td><a href="#"><i class="fa-solid fa-lock-open"></i></a></td>
                </tr>
                <tr>
                    <td>12345</td>
                    <td>Lael Greer</td>
                    <td>2009/02/27</td>
                    <td>London</td>
                    <td>0987654321</td>
                    <td>01/01/1990</td>
                    <td><a href="#"><i class="fa-solid fa-lock"></i></a></td>
                </tr>
                <tr>
                    <td>12345</td>
                    <td>Jonas Alexander</td>
                    <td>2010/07/14</td>
                    <td>San Francisco</td>
                    <td>0987654321</td>
                    <td>01/01/1990</td>
                    <td><a href="#"><i class="fa-solid fa-lock-open"></i></a></td>
                </tr>
                <tr>
                    <td>12345</td>
                    <td>Shad Decker</td>
                    <td>2008/11/13</td>
                    <td>Edinburgh</td>
                    <td>0987654321</td>
                    <td>01/01/1990</td>
                    <td><a href="#"><i class="fa-solid fa-lock"></i></a></td>
                </tr>
<!--                <tr>
                    <td>12345</td>
                    <td>Michael Bruce</td>
                    <td>2011/06/27</td>
                    <td>Singapore</td>
                    <td>0987654321</td>
                    <td>01/01/1990</td>
                    <td><a href="#"><i class="fa-solid fa-lock-open"></i></a></td>
                </tr>
                <tr>
                    <td>12345</td>
                    <td>Donna Snider</td>
                    <td>2011/01/25</td>
                    <td>New York</td>
                    <td>0987654321</td>
                    <td>01/01/1990</td>
                    <td><a href="#"><i class="fa-solid fa-lock"></i></a></td>
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
