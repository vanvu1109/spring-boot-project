<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Truy cập bị từ chối | TECHNET SOLUTIONS</title>
    <style>
        /* Tùy chỉnh màu sắc và bố cục cơ bản */
        :root {
            --primary-blue: #0A1931;
            --light-blue: #185ADB;
            --accent-gold: #FFC947;
            --text-main: #FFFFFF;
            --text-muted: #A0AABF;
            --card-bg: rgba(255, 255, 255, 0.05);
            --shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--text-main);
            background: radial-gradient(circle at center, #102A4E 0%, var(--primary-blue) 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            text-align: center;
        }

        .main-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            max-width: 900px;
            width: 100%;
            padding: 20px;
        }

        .header {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 40px;
        }

        .logo {
            font-weight: bold;
            font-size: 1.2rem;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 0.9rem;
            color: var(--text-muted);
        }

        .access-card {
            background-color: var(--card-bg);
            border: 1px solid rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 60px 40px;
            box-shadow: var(--shadow);
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }

        .card-inner {
            display: flex;
            align-items: center;
            gap: 40px;
            text-align: left;
        }

        .text-section {
            flex: 1;
        }

        h1.title {
            margin-top: 0;
            margin-bottom: 10px;
            font-size: 2.5rem;
            line-height: 1.2;
            font-weight: 800;
        }

        p.subtitle {
            margin-bottom: 20px;
            color: var(--text-muted);
            font-size: 1.1rem;
        }

        p.description {
            margin-bottom: 30px;
            font-size: 1rem;
            line-height: 1.6;
        }

        span.error-code {
            display: block;
            margin-top: -10px;
            margin-bottom: 30px;
            color: var(--accent-gold);
            font-weight: bold;
            font-size: 1rem;
        }

        .illustration {
            width: 300px;
            height: auto;
        }

        .button-group {
            display: flex;
            gap: 20px;
            margin-top: 20px;
        }

        .btn {
            display: inline-block;
            padding: 12px 30px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .btn-primary {
            background-color: var(--light-blue);
            color: #FFFFFF;
        }

        .btn-primary:hover {
            background-color: #216CE7;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background-color: transparent;
            border: 2px solid var(--text-main);
            color: var(--text-main);
        }

        .btn-secondary:hover {
            background-color: var(--text-main);
            color: var(--primary-blue);
            transform: translateY(-2px);
        }

        .footer {
            margin-top: 60px;
            width: 100%;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding-top: 30px;
            font-size: 0.8rem;
            color: var(--text-muted);
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .footer a {
            color: var(--text-muted);
            text-decoration: none;
        }

        .footer a:hover {
            color: var(--accent-gold);
        }

        .jsp-time {
            color: var(--accent-gold);
        }
    </style>
</head>
<body>
    <div class="main-content">
        <div class="header">
            <div class="logo">TECHNET SOLUTIONS</div>
            <div class="user-info">
                <span>Khách</span>
                <a href="/login">Đăng nhập →</a>
            </div>
        </div>

        <div class="access-card">
            <div class="card-inner">
                <div class="text-section">
                    <h1 class="title">KHÔNG CÓ QUYỀN TRUY CẬP</h1>
                    <span class="error-code">Error 403 | Forbidden</span>
                    <p class="subtitle">Rất tiếc, bạn không có quyền xem trang này.</p>
                    <p class="description">
                        Trang này yêu cầu quyền đặc quyền cụ thể. Vui lòng kiểm tra lại tài khoản hoặc liên hệ với quản trị viên.
                        Hệ thống ghi nhận yêu cầu vào: <span class="jsp-time"><%= new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new Date()) %></span>
                    </p>
                    <div class="button-group">
                        <a href="/" class="btn btn-primary">Quay lại trang chủ</a>
                        <a href="/contact" class="btn btn-secondary">Liên hệ hỗ trợ</a>
                    </div>  
                </div>
                <img src="/path/to/lock_illustration.png" alt="Truy cập bị từ chối" class="illustration">
            </div>
        </div>

        <div class="footer">
            <a href="#">Trang chủ</a>
            <a href="#">Dịch vụ</a>
            <a href="#">Liên hệ</a>
            <a href="#">Trạng thái</a>
        </div>
    </div>
</body>
</html>