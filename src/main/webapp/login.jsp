<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>4A班级学生成绩管理系统 - 登录</title>
    <style>
        body { font-family: "Microsoft YaHei", sans-serif; background: #f0f2f5; margin: 0; padding: 0; }
        .login-box { width: 360px; margin: 120px auto; background: #fff; padding: 40px; border-radius: 8px; box-shadow: 0 2px 12px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #333; margin-bottom: 30px; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 8px; color: #555; }
        input[type="text"], input[type="password"] { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; font-size: 14px; }
        button { width: 100%; padding: 12px; background: #1890ff; color: #fff; border: none; border-radius: 4px; font-size: 16px; cursor: pointer; }
        button:hover { background: #40a9ff; }
        .error { color: #ff4d4f; text-align: center; margin-bottom: 15px; }
        .tip { text-align: center; color: #999; font-size: 13px; margin-top: 20px; line-height: 1.8; }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>4A班级成绩管理系统</h2>
        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>
        <form action="login" method="post">
            <div class="form-group">
                <label>用户名</label>
                <input type="text" name="username" required placeholder="教师: teacher / 学生: 学号">
            </div>
            <div class="form-group">
                <label>密码</label>
                <input type="password" name="password" required placeholder="默认密码: 123456">
            </div>
            <button type="submit">登 录</button>
        </form>
        <div class="tip">
            教师账号：teacher / 123456<br>
            学生账号：2024001~2024005 / 123456
        </div>
    </div>
</body>
</html>
