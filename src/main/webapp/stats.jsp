<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>成绩统计分析</title>
    <style>
        body { font-family: "Microsoft YaHei", sans-serif; background: #f0f2f5; margin: 0; }
        .header { background: #722ed1; color: #fff; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; }
        .header a { color: #fff; text-decoration: none; margin-left: 20px; }
        .container { max-width: 900px; margin: 30px auto; padding: 0 20px; }
        .card { background: #fff; padding: 25px; border-radius: 8px; box-shadow: 0 1px 4px rgba(0,0,0,0.08); }
        h3 { color: #333; border-bottom: 2px solid #722ed1; padding-bottom: 10px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #e8e8e8; padding: 14px; text-align: center; }
        th { background: #fafafa; color: #555; }
        .highlight { color: #722ed1; font-weight: bold; font-size: 18px; }
        .bar-bg { background: #f0f0f0; height: 20px; border-radius: 10px; overflow: hidden; }
        .bar { background: linear-gradient(90deg, #722ed1, #9254de); height: 100%; border-radius: 10px; }
    </style>
</head>
<body>
    <div class="header">
        <span>4A班级成绩管理系统 - 成绩统计</span>
        <span>
            <a href="teacher">返回教师主页</a>
            <a href="logout">退出登录</a>
        </span>
    </div>
    <div class="container">
        <div class="card">
            <h3>各课程平均分与及格率统计</h3>
            <table>
                <tr><th>课程名称</th><th>参考人数</th><th>平均分</th><th>及格率</th><th>及格率可视化</th></tr>
                <% Map<String, double[]> stats = (Map<String, double[]>) request.getAttribute("stats");
                   if (stats != null) {
                       for (Map.Entry<String, double[]> e : stats.entrySet()) {
                           String course = e.getKey();
                           double[] data = e.getValue();
                           double avg = data[0];
                           double passRate = data[1];
                           int count = (int) data[2]; %>
                    <tr>
                        <td><%= course %></td>
                        <td><%= count %></td>
                        <td><span class="highlight"><%= String.format("%.2f", avg) %></span></td>
                        <td><span class="highlight"><%= String.format("%.1f", passRate) %>%</span></td>
                        <td>
                            <div class="bar-bg">
                                <div class="bar" style="width: <%= passRate %>%"></div>
                            </div>
                        </td>
                    </tr>
                <% } } %>
            </table>
        </div>
    </div>
</body>
</html>
