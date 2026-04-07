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
                        <li class="breadcrumb-item active">Products</li>
                    </ol>
                    <div class="container mt-5">
                    <div class="col-12 mx-auto">
                        <div class="d-flex justify-content-between mb-4">
                            <h2>Table Products</h2>
                            <a href="/admin/product/create" class="btn btn-primary">
                            <span class="text-center"> Create Product</span>
                            </a>
                        </div>
                        <hr/>
                        <table class="table table-hover table-bordered">
                        <thead>
                            <tr class="table-primary text-center">
                                <th scope="col">ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Description</th>
                                <th scope="col">Sold</th>
                                <th scope="col">Target</th>
                                <th scope="col">Factory</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Action</th>
                                
                            </tr>
                        </thead>
                        <tbody class="text-center">
                            <c:forEach var="product" items="${arrayProducts}">
                                <tr>
                                    <td>${product.id}</td>  
                                    <td>${product.name}</td>
                                    <td>${product.detailDesc}</td>
                                    <td>${product.sold}</td>
                                    <td>${product.target}</td>
                                    <td>${product.factory}</td>
                                    <td>${product.quantity}</td>
                                    <td>
                                        <div class="d-flex justify-content-center gap-2">
                                            <a href="/admin/product/view/${product.id}" class="btn btn-success">View</a> 
                                            <a href="/admin/product/update/${product.id}" class="btn btn-primary">Update</a> 
                                            <a href="/admin/product/delete/${product.id}" class="btn btn-danger">Delete</a> 
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        </table>
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