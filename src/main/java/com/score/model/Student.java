package com.score.model;

public class Student {
    private String studentId;
    private String name;
    private String className;

    public Student() {}

    public Student(String studentId, String name, String className) {
        this.studentId = studentId;
        this.name = name;
        this.className = className;
    }

    public String getStudentId() { return studentId; }
    public void setStudentId(String studentId) { this.studentId = studentId; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getClassName() { return className; }
    public void setClassName(String className) { this.className = className; }
}
