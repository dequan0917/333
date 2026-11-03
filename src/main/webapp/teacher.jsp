<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.score.model.User" %>
<%@ page import="com.score.model.Student" %>
<%@ page import="com.score.model.Score" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>教师主页 - 成绩管理</title>
    <style>
        body { font-family: "Microsoft YaHei", sans-serif; background: #f0f2f5; margin: 0; }
        .header { background: #1890ff; color: #fff; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; }
        .header a { color: #fff; text-decoration: none; margin-left: 20px; }
        .container { max-width: 1000px; margin: 30px auto; padding: 0 20px; }
        .card { background: #fff; padding: 25px; border-radius: 8px; margin-bottom: 25px; box-shadow: 0 1px 4px rgba(0,0,0,0.08); }
        h3 { color: #333; border-bottom: 2px solid #1890ff; padding-bottom: 10px; }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { border: 1px solid #e8e8e8; padding: 10px; text-align: center; }
        th { background: #fafafa; color: #555; }
        .form-row { display: flex; gap: 15px; margin-bottom: 15px; flex-wrap: wrap; }
        .form-row div { flex: 1; min-width: 150px; }
        label { display: block; margin-bottom: 5px; color: #666; font-size: 14px; }
        input, select { width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        button { padding: 10px 25px; background: #1890ff; color: #fff; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background: #40a9ff; }
        .msg { color: #52c41a; margin-bottom: 15px; }
        .err { color: #ff4d4f; margin-bottom: 15px; }
        .btn-stats { background: #722ed1; }
        .btn-stats:hover { background: #9254de; }
    </style>
</head>
<body>
    <div class="header">
        <span>4A班级成绩管理系统 - 教师端</span>
        <span>
            <% User u = (User) session.getAttribute("user"); %>
            欢迎，<%= u.getName() %>
            <a href="stats">成绩统计</a>
            <a href="logout">退出登录</a>
        </span>
    </div>
    <div class="container">
        <div class="card">
            <h3>录入学生成绩</h3>
            <% if (request.getAttribute("msg") != null) { %><div class="msg"><%= request.getAttribute("msg") %></div><% } %>
            <% if (request.getAttribute("error") != null) { %><div class="err"><%= request.getAttribute("error") %></div><% } %>
            <form action="teacher" method="post">
                <div class="form-row">
                    <div>
                        <label>选择学生</label>
                        <select name="studentId" required>
                            <% List<Student> students = (List<Student>) request.getAttribute("students");
                               if (students != null) { for (Student s : students) { %>
                                <option value="<%= s.getStudentId() %>"><%= s.getStudentId() %> - <%= s.getName() %></option>
                            <% } } %>
                        </select>
                    </div>
                    <div>
                        <label>课程名称</label>
                        <input type="text" name="course" required placeholder="如：Java程序设计">
                    </div>
                    <div>
                        <label>成绩</label>
                        <input type="number" name="score" step="0.1" min="0" max="100" required placeholder="0-100">
                    </div>
                </div>
                <button type="submit">录入成绩</button>
            </form>
        </div>
        <div class="card">
            <h3>全部成绩列表</h3>
            <table>
                <tr><th>学号</th><th>姓名</th><th>课程</th><th>成绩</th></tr>
                <% List<Score> scores = (List<Score>) request.getAttribute("scores");
                   if (scores != null) { for (Score s : scores) { %>
                    <tr>
                        <td><%= s.getStudentId() %></td>
                        <td><%= s.getStudentName() %></td>
                        <td><%= s.getCourse() %></td>
                        <td><%= s.getScore() %></td>
                    </tr>
                <% } } %>
            </table>
        </div>
    </div>
</body>
</html>
