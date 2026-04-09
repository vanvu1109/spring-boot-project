<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
    <meta name="author" content="Hỏi Dân IT" />
    <title>Dashboard</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").css({ "display": "block" });
            });
        });
    </script>
</head>

<body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
        <jsp:include page="../layout/sidebar.jsp" />
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Create a user</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                        <li class="breadcrumb-item active">users</li>
                    </ol>
                    <div class="mt-5">
                    <div class="row justify-content-center">
                        <div class="col-md-6 col-lg-5 mx-auto">
                            <form:form 
                                class="p-4" 
                                method="post" 
                                action="/admin/user/create"
                                modelAttribute="newUser"
                                enctype="multipart/form-data"
                            > 
                                <h2 class="mb-4">Create a user</h2>
                                <hr/>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <c:set var="errors">
                                            <form:errors path="email" cssClass="invalid-feedback" /> 
                                        </c:set>
                                        <label for="email" class="form-label">Email</label>
                                        <form:input type="email" class="form-control ${not empty errors ? 'is-invalid' : ''}" path="email"/>
                                        ${errors}
                                    </div>
                                
                                    <div class="col-md-6">
                                        <c:set var="errors">
                                            <form:errors path="password" cssClass="invalid-feedback" /> 
                                        </c:set>
                                        <label for="password" class="form-label">Password</label>
                                        <form:input type="password" class="form-control ${not empty errors ? 'is-invalid' : ''}" path="password"/>
                                        ${errors}
                                    </div>
                                </div>
                                
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="text" class="form-label">Phone Number</label>
                                        <form:input type="text" class="form-control" path="phone"/>
                                    </div>
                                
                                    <div class="col-md-6">
                                        <c:set var="errors">
                                            <form:errors path="fullName" cssClass="invalid-feedback" /> 
                                        </c:set>
                                        <label for="fullname" class="form-label">Full Name</label>
                                        <form:input type="text" class="form-control ${not empty errors ? 'is-invalid' : ''}" path="fullName"/>
                                        ${errors}
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <form:input type="text" class="form-control" path="address"
                                    />
                                </div>
                                
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Role</label>
                                        <form:select class="form-select" path="role.name">
                                            <form:option value="Admin">Admin</form:option>
                                            <form:option value="User">User</form:option>
                                        </form:select>
                                    </div>
                                
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="avatarFile" class="form-label">Avatar</label>
                                            <input 
                                                class="form-control" 
                                                type="file" 
                                                id="avatarFile" 
                                                accept=".png, .jpg, .jpeg" 
                                                name="file"
                                            />
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <img style="max-height: 250px; display: none;" alt="avatar preview" id="avatarPreview">
                                    </div>
                                </div>

                                
                                <div class="row mb-3">
                                    <div class="mt-4">
                                    <button type="submit" class="btn btn-primary btn-lg">Create</button>
                                </div>
                            </div>
                            </form:form>
                        </div>
                    </div>
                </div>
                </div>
            </main>
            <jsp:include page="../layout/footer.jsp" />
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
</body>

</html>