package dto;

import java.sql.Timestamp;
import java.util.UUID;

public class DoTest {

    private UUID testId;
    private UUID accountId;
    private Timestamp startTime;
    private Timestamp finishTime;
    private Double score;

    public DoTest(UUID testId, UUID accountId, Timestamp startTime, Timestamp finishTime, Double score) {
        this.testId = testId;
        this.accountId = accountId;
        this.startTime = startTime;
        this.finishTime = finishTime;
        this.score = score;
    }

    public UUID getTestId() {
        return testId;
    }

    public void setTestId(UUID testId) {
        this.testId = testId;
    }

    public UUID getAccountId() {
        return accountId;
    }

    public void setAccountId(UUID accountId) {
        this.accountId = accountId;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(Timestamp finishTime) {
        this.finishTime = finishTime;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "DoTest(" + String.join(", ", new String[]{
            testId.toString(),
            accountId.toString(),
            startTime.toString(),
            finishTime.toString(),
            score.toString()
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        DoTest doTest = (DoTest) obj;
        return doTest.testId.equals(this.testId) && doTest.accountId.equals(this.accountId);
    }

}
