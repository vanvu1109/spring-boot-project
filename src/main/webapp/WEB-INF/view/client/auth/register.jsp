<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>REGISTER</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body style="background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
    
    <main class="d-flex align-items-center justify-content-center" style="min-height: 100vh; width: 100%;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-11 col-md-8 col-lg-6">
                    <form:form method="post" action="/register" modelAttribute="registerUser"> 
                        <c:set var="errorPassword">
                            <form:errors path="passwordConfirm" cssClass="invalid-feedback" /> 
                        </c:set>
                        <c:set var="errorEmail">
                            <form:errors path="email" cssClass="invalid-feedback" /> 
                        </c:set>
                        <c:set var="errorFirstName">
                            <form:errors path="firstName" cssClass="invalid-feedback" /> 
                        </c:set>
                        
                        <div class="card p-4 p-sm-5" style="border-radius: 20px; box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1); background-color: rgba(255, 255, 255, 0.95); border: 1px solid rgba(255, 255, 255, 0.2);">
                            
                            <h2 class="text-center" style="font-weight: 700; color: #2b3a4a; letter-spacing: 0.5px; margin-bottom: 30px;">Create Account</h2>
                            <hr/>
                            <div class="row mb-3">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="firstName" class="form-label">First Name</label>
                                    <form:input 
                                        class="form-control ${not empty errorFirstName ? 'is-invalid' : ''}"
                                        type="text" 
                                        placeholder="First Name" 
                                        style="border-radius: 10px; padding: 14px 18px; border: 1.5px solid #e2e8f0; background-color: #f8fafc; font-size: 15px;" 
                                        path="firstName"
                                        name="firstName"
                                    />
                                    ${errorFirstName}
                                </div>
                                <div class="col-sm-6">
                                    <label for="lastName" class="form-label">Last Name</label>
                                    <form:input class="form-control" 
                                        type="text" placeholder="Last Name" 
                                        style="border-radius: 10px; padding: 14px 18px; border: 1.5px solid #e2e8f0; background-color: #f8fafc; font-size: 15px;" 
                                        path="lastName"
                                        name="lastName"
                                    />
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Email address</label>
                                <form:input 
                                    class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                    type="email" placeholder="Email" 
                                    style="border-radius: 10px; padding: 14px 18px; border: 1.5px solid #e2e8f0; background-color: #f8fafc; font-size: 15px;" 
                                    path="email"
                                    name="email"
                                />
                                ${errorEmail}
                            </div>

                            <div class="row mb-4">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="password" class="form-label">Password</label>
                                    <form:input 
                                        class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                        type="password" 
                                        placeholder="Password" 
                                        style="border-radius: 10px; padding: 14px 18px; border: 1.5px solid #e2e8f0; background-color: #f8fafc; font-size: 15px;" 
                                        path="password"
                                        name="password"
                                    />
                                    ${errorPassword}
                                </div>
                                <div class="col-sm-6">
                                     <label for="passwordConfirm" class="form-label">Confirm Password</label>
                                    <form:input 
                                        class="form-control"
                                        type="password" placeholder="Confirm Password" 
                                        style="border-radius: 10px; padding: 14px 18px; border: 1.5px solid #e2e8f0; background-color: #f8fafc; font-size: 15px;" 
                                        path="passwordConfirm"
                                        name="passwordConfirm"
                                        />
                                </div>
                            </div>

                            <div class="d-grid mt-2">
                                <button class="btn btn-primary" type="submit" style="border-radius: 10px; padding: 14px; font-weight: 600; font-size: 16px; background: linear-gradient(to right, #3b82f6, #2563eb); border: none; letter-spacing: 0.5px; color: white;">
                                    Create Account
                                </button>
                            </div>
                            <hr/>
                            <span class="text-center">Already have an account? <a href="/login">Login</a></span>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>

</html>