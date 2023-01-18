package dto;

import java.sql.Timestamp;
import java.util.UUID;

public class DoTest {

    private UUID assignTestId;
    private UUID accountId;
    private Timestamp startTime;
    private Timestamp finishTime;
    private Double score;

    public DoTest(UUID assignTestId, UUID accountId, Timestamp startTime, Timestamp finishTime, Double score) {
        this.assignTestId = assignTestId;
        this.accountId = accountId;
        this.startTime = startTime;
        this.finishTime = finishTime;
        this.score = score;
    }

    public UUID getAssignTestId() {
        return assignTestId;
    }

    public void setAssignTestId(UUID assignTestId) {
        this.assignTestId = assignTestId;
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
            assignTestId.toString(),
            accountId.toString(),
            startTime.toString(),
            finishTime.toString(),}) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        DoTest doTest = (DoTest) obj;
        return doTest.assignTestId.equals(this.assignTestId) && doTest.accountId.equals(this.accountId);
    }

}
