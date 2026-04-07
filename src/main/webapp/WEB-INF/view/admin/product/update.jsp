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
                    <h1 class="mt-4">Create a Product</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                        <li class="breadcrumb-item active">Products</li>
                    </ol>
                    <div class="mt-5">
                    <div class="row justify-content-center">
                        <div class="col-md-6 col-lg-5 mx-auto">
                            <form:form 
                                class="p-4" 
                                method="post" 
                                action="/admin/product/update"
                                modelAttribute="newProduct"
                                enctype="multipart/form-data"
                            > 
                                <h2 class="mb-4">Create a Product</h2>
                                <hr/>

                                <div class="mb-3" style="display: none;">
                                    <label class="form-label">ID:</label>
                                    <form:input type="text" class="form-control"
                                        path="id"
                                    />
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Name</label>
                                        <form:input type="text" class="form-control" path="name"/>
                                    </div>  
                                
                                    <div class="col-md-6">
                                        <label for="price" class="form-label">Price</label>
                                        <form:input type="number" class="form-control" path="price"/>
                                    </div>
                                </div>

                                <div class="col-mb-3">
                                        <label class="form-label">Detail description</label>
                                        <form:input type="text" class="form-control" path="detailDesc"/>
                                </div>
                                
                                <div class="row mb-3 mt-3">
                                    <div class="col-md-6">
                                        <c:set var="errors">
                                            <form:errors path="shortDesc" cssClass="invalid-feedback" /> 
                                        </c:set>
                                        <label class="form-label">Short description</label>
                                        <form:input type="text" class="form-control" path="shortDesc"/>
                                    </div>
                                
                                    <div class="col-md-6">
                                        <label for="price" class="form-label">Quantity</label>
                                        <form:input type="number" class="form-control" path="quantity"/>
                                    </div>
                                </div>  

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Factory</label>
                                        <form:select class="form-select" path="factory" >
                                            <form:option value="Apple">Apple</form:option>
                                            <form:option value="Mac">Mac</form:option>
                                        </form:select>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Target</label>
                                        <form:select class="form-select" path="target">
                                            <form:option value="Gaming">Gaming</form:option>
                                            <form:option value="Mac">Mac</form:option>
                                        </form:select>
                                    </div>
                                </div>
                                
                                <div class="row mb-3">
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

                                </div>
                                <div class="col-md-6">
                                    <img style="max-height: 250px; display: none;" alt="avatar preview" id="avatarPreview">
                                </div>

                                
                                <div class="row mb-3">   
                                    <div class="mt-4">
                                        <button type="submit" class="btn btn-primary btn-lg">Update</button>
                                    </div>
                                </div>
                            </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </main>
            <jsp:include page="../layout/footer.jsp" />
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
</body>

</html>