<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/demo.css">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5 mx-auto">
                <form:form 
                    class="card p-4 shadow-sm" 
                    method="post" 
                    action="/admin/user/create"
                    modelAttribute="newUser"
                > 
                    <h1 class="text-center mb-4">Create a user</h1>
                    <hr/>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email address</label>
                        <form:input 
                            type="email" 
                            class="form-control"
                            path="email"
                        />
                    </div>
                    
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <form:input type="password" class="form-control"
                            path="password"
                        />
                    </div>
                    
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone</label>
                        <form:input type="text" class="form-control"
                            path="phone"
                        />
                    </div>
                    
                    <div class="mb-3">
                        <label for="fullName" class="form-label">Full Name</label>
                        <form:input type="text" class="form-control"
                            path="fullName"
                        />
                    </div>

                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <form:input type="text" class="form-control"
                            path="address"
                        />
                    </div>
                    
                    <div class="d-grid mt-4">
                        <button type="submit" class="btn btn-primary btn-lg">Create</button>
                    </div>
                </form:form>

            </div>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>