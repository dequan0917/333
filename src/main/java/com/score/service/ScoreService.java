package com.score.service;

import com.score.dao.DataStore;
import com.score.model.Score;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ScoreService {

    public double getClassAverage(String course) {
        List<Score> all = DataStore.getAllScores();
        double sum = 0;
        int count = 0;
        for (Score s : all) {
            if (s.getCourse().equals(course)) {
                sum += s.getScore();
                count++;
            }
        }
        return count > 0 ? sum / count : 0;
    }

    public double getPassRate(String course) {
        List<Score> all = DataStore.getAllScores();
        int total = 0;
        int pass = 0;
        for (Score s : all) {
            if (s.getCourse().equals(course)) {
                total++;
                if (s.getScore() >= 60) {
                    pass++;
                }
            }
        }
        return total > 0 ? (pass * 100.0 / total) : 0;
    }

    public double getStudentAverage(String studentId) {
        List<Score> scores = DataStore.getScoresByStudentId(studentId);
        if (scores.isEmpty()) return 0;
        double sum = 0;
        for (Score s : scores) {
            sum += s.getScore();
        }
        return sum / scores.size();
    }

    public Map<String, double[]> getCourseStats() {
        Map<String, double[]> stats = new HashMap<>();
        List<Score> all = DataStore.getAllScores();
        Map<String, double[]> temp = new HashMap<>();
        for (Score s : all) {
            String course = s.getCourse();
            double[] data = temp.getOrDefault(course, new double[]{0, 0, 0}); // sum, count, pass
            data[0] += s.getScore();
            data[1]++;
            if (s.getScore() >= 60) data[2]++;
            temp.put(course, data);
        }
        for (Map.Entry<String, double[]> e : temp.entrySet()) {
            double[] d = e.getValue();
            double avg = d[1] > 0 ? d[0] / d[1] : 0;
            double passRate = d[1] > 0 ? d[2] * 100 / d[1] : 0;
            stats.put(e.getKey(), new double[]{avg, passRate, d[1]});
        }
        return stats;
    }
}
