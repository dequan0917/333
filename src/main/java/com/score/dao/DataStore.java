package com.score.dao;

import com.score.model.Score;
import com.score.model.Student;
import com.score.model.User;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

public class DataStore {
    private static List<User> users = new CopyOnWriteArrayList<>();
    private static List<Student> students = new CopyOnWriteArrayList<>();
    private static List<Score> scores = new CopyOnWriteArrayList<>();

    static {
        // 初始化教师账号
        users.add(new User("teacher", "123456", "teacher", "张老师"));
        // 初始化学生账号和信息
        users.add(new User("2024001", "123456", "student", "张三"));
        users.add(new User("2024002", "123456", "student", "李四"));
        users.add(new User("2024003", "123456", "student", "王五"));
        users.add(new User("2024004", "123456", "student", "赵六"));
        users.add(new User("2024005", "123456", "student", "钱七"));

        students.add(new Student("2024001", "张三", "4A"));
        students.add(new Student("2024002", "李四", "4A"));
        students.add(new Student("2024003", "王五", "4A"));
        students.add(new Student("2024004", "赵六", "4A"));
        students.add(new Student("2024005", "钱七", "4A"));

        // 初始化一些成绩数据
        scores.add(new Score("2024001", "张三", "Java程序设计", 85.5));
        scores.add(new Score("2024002", "李四", "Java程序设计", 72.0));
        scores.add(new Score("2024003", "王五", "Java程序设计", 91.0));
        scores.add(new Score("2024004", "赵六", "Java程序设计", 58.0));
        scores.add(new Score("2024005", "钱七", "Java程序设计", 67.5));
    }

    public static User findUser(String username, String password) {
        for (User u : users) {
            if (u.getUsername().equals(username) && u.getPassword().equals(password)) {
                return u;
            }
        }
        return null;
    }

    public static Student findStudent(String studentId) {
        for (Student s : students) {
            if (s.getStudentId().equals(studentId)) {
                return s;
            }
        }
        return null;
    }

    public static List<Student> getAllStudents() {
        return new ArrayList<>(students);
    }

    public static List<Score> getAllScores() {
        return new ArrayList<>(scores);
    }

    public static List<Score> getScoresByStudentId(String studentId) {
        List<Score> result = new ArrayList<>();
        for (Score s : scores) {
            if (s.getStudentId().equals(studentId)) {
                result.add(s);
            }
        }
        return result;
    }

    public static void addScore(Score score) {
        // 如果该学生该课程已有成绩，则更新
        for (int i = 0; i < scores.size(); i++) {
            Score s = scores.get(i);
            if (s.getStudentId().equals(score.getStudentId()) && s.getCourse().equals(score.getCourse())) {
                scores.set(i, score);
                return;
            }
        }
        scores.add(score);
    }

    public static void addStudent(Student student) {
        if (findStudent(student.getStudentId()) == null) {
            students.add(student);
        }
    }
}
