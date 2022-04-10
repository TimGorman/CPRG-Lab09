<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css" type="text/css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">

    </head>
    <body>
        <c:if test="${message != null}">
            <div id="messageBox">
                <p class="${messageType}">${message}</p>
            </div>
        </c:if>

        <h1>Users</h1>

        <div class="grid-container">
            <div class="grid-item">
                <div class="formContainer">
                    <h3>Add New User</h3>

                    <form method="POST" action="users">
                        <input placeholder="Email" type="email" required name="email" />
                        <br>
                        <input placeholder="First Name" type="text" required name="firstname" />
                        <br>
                        <input placeholder="Last Name" type="text" required name="lastname" />
                        <br>
                        <input placeholder="Password" type="password" required name="password" />
                        <br>
                        <input type="hidden" name="action" value="add" />
                        <select name="role">
                            <option value="1" <c:if test="${user.role.id == 1}">selected</c:if>>System Admin</option>
                            <option value="2" <c:if test="${user.role.id == 2}">selected</c:if>>Regular User</option>
                            <option value="3" <c:if test="${user.role.id == 3}">selected</c:if>>Company Admin</option>
                            </select>
                            <br>
                            <input type="submit" value="Save" />
                        </form>
                    </div>
                </div>

                <div class="grid-item">
                    <h3>Manage Users</h3>
                    <table class="usersTable">
                        <tr>
                            <th>Email</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Role</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.email}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td class="uppercaseFirstLetter">${user.role.roleName}</td>

                            <c:url value="users" var="editurl">
                                <c:param name="action" value="edit"/>
                                <c:param name="email" value="${user.email}"/>
                            </c:url>
                            <td><a href="${editurl}">Edit</a></td>

                            <c:url value="users" var="deleteurl">
                                <c:param name="method" value="POST"/>
                                <c:param name="action" value="delete"/>
                                <c:param name="email" value="${user.email}"/>
                            </c:url>                     
                            <td><a href="${deleteurl}">Delete</a></td>
                        </tr>

                    </c:forEach>
                </table>
            </div>

            <div class="grid-item">
                <div class="formContainer">
                    <h3>Edit User</h3>
                    <form method="POST" action="users">
                        <input <c:if test="${editUser == null}">disabled</c:if> placeholder="First Name" type="text" required name="firstname" value="${editUser.firstName}" />
                            <br>
                            <input <c:if test="${editUser == null}">disabled</c:if> placeholder="Last Name" type="text" required name="lastname" value="${editUser.lastName}" />
                            <br>
                            <input <c:if test="${editUser == null}">disabled</c:if> type="hidden" name="email" value="${editUser.email}" />
                            <input type="hidden" name="action" value="update" />
                            <select <c:if test="${editUser == null}">disabled</c:if> name="role">
                            <option value="1" <c:if test="${editUser.role.roleId == 1}">selected</c:if>>System Admin</option>
                            <option value="2" <c:if test="${editUser.role.roleId == 2}">selected</c:if>>Regular User</option>
                            <option value="3" <c:if test="${editUser.role.roleId == 3}">selected</c:if>>Company Admin</option>
                            </select>
                            <br>
                            <input <c:if test="${editUser == null}">disabled</c:if> type="submit" value="Update" />
                        </form>
                    <c:if test="${editUser == null}">
                        <p class="helperText">Select a user in the table to edit.</p>
                    </c:if>
                </div>
            </div>  
        </div>
    </body>
</html>
