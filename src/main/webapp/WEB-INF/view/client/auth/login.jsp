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
</head>

<body style="background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
    
    <main class="d-flex align-items-center justify-content-center" style="min-height: 100vh; width: 100%;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-11 col-md-8 col-lg-6">
                    <form:form method="post" modelAttribute="loginUser" action="/login"> 
                       
                        
                        <div class="card p-4 p-sm-5" style="border-radius: 20px; box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1); background-color: rgba(255, 255, 255, 0.95); border: 1px solid rgba(255, 255, 255, 0.2);">
                            
                            <h2 class="text-center" style="font-weight: 700; color: #2b3a4a; letter-spacing: 0.5px; margin-bottom: 30px;">Login</h2>
                            <hr/>
                                <c:if test="${param.error != null}">
                                    <div class="alert alert-danger" role="alert">
                                        Invalid username or password.
                                    </div>
                                </c:if>
                                <c:if test="${param.logout != null}">
                                    <div class="alert alert-success" role="alert">
                                        You have been logged out.
                                    </div>
                                </c:if>
                                <div class="col-mb-3">
                                    <label for="firstName" class="form-label">Email</label>
                                    <form:input 
                                        class="form-control mb-3" 
                                        type="text" 
                                        placeholder="Email" 
                                        style="border-radius: 10px; padding: 14px 18px; border: 1.5px solid #e2e8f0; background-color: #f8fafc; font-size: 15px;" 
                                        name="username"
                                        path="email"
                                    />
                                </div>
                                
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                               <div class="col-mb-3">
                                    <label for="lastName" class="form-label">Password</label>
                                    <form:input class="form-control mb-3" 
                                        type="password" placeholder="Password" 
                                        style="border-radius: 10px; padding: 14px 18px; border: 1.5px solid #e2e8f0; background-color: #f8fafc; font-size: 15px;" 
                                        name="password"
                                        path="password"
                                    />
                                </div>
                            

                            <div class="d-grid mt-2">
                                <button class="btn btn-primary" type="submit" style="border-radius: 10px; padding: 14px; font-weight: 600; font-size: 16px; background: linear-gradient(to right, #3b82f6, #2563eb); border: none; letter-spacing: 0.5px; color: white;">
                                   Login
                                </button>
                            </div>
                            <hr/>
                            <span class="text-center">Need an account? <a href="/register">Sign up!</a></span>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>

</html>