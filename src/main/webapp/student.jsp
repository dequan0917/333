<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.score.model.Score" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生成绩查询</title>
    <style>
        body { font-family: "Microsoft YaHei", sans-serif; background: #f0f2f5; margin: 0; }
        .header { background: #52c41a; color: #fff; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; }
        .header a { color: #fff; text-decoration: none; }
        .container { max-width: 800px; margin: 30px auto; padding: 0 20px; }
        .card { background: #fff; padding: 25px; border-radius: 8px; margin-bottom: 25px; box-shadow: 0 1px 4px rgba(0,0,0,0.08); }
        h3 { color: #333; border-bottom: 2px solid #52c41a; padding-bottom: 10px; }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { border: 1px solid #e8e8e8; padding: 12px; text-align: center; }
        th { background: #fafafa; color: #555; }
        .avg-box { background: #f6ffed; border: 1px solid #b7eb8f; padding: 15px; border-radius: 4px; margin-top: 15px; font-size: 16px; }
        .pass { color: #52c41a; font-weight: bold; }
        .fail { color: #ff4d4f; font-weight: bold; }
    </style>
</head>
<body>
    <div class="header">
        <span>4A班级成绩管理系统 - 学生端</span>
        <a href="logout">退出登录</a>
    </div>
    <div class="container">
        <div class="card">
            <h3><%= request.getAttribute("studentName") %> 的成绩查询</h3>
            <table>
                <tr><th>课程名称</th><th>成绩</th><th>状态</th></tr>
                <% List<Score> scores = (List<Score>) request.getAttribute("scores");
                   if (scores != null && !scores.isEmpty()) {
                       for (Score s : scores) { %>
                    <tr>
                        <td><%= s.getCourse() %></td>
                        <td><%= s.getScore() %></td>
                        <td><%= s.getScore() >= 60 ? "<span class='pass'>及格</span>" : "<span class='fail'>不及格</span>" %></td>
                    </tr>
                <% } } else { %>
                    <tr><td colspan="3">暂无成绩数据</td></tr>
                <% } %>
            </table>
            <div class="avg-box">
                个人平均分：<strong><%= String.format("%.2f", request.getAttribute("average")) %></strong> 分
            </div>
        </div>
    </div>
</body>
</html>
