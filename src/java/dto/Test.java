package dto;

import java.util.UUID;

public class Test {

    private UUID testId;
    private String title;
    private String description;

    public Test(UUID testId, String title, String description) {
        this.testId = testId;
        this.title = title;
        this.description = description;
    }

    public UUID getTestId() {
        return testId;
    }

    public void setTestId(UUID testId) {
        this.testId = testId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Test(" + String.join(", ", new String[]{
            testId.toString(),
            title,
            description
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        Test test = (Test) obj;
        return test.testId.equals(this.testId);
    }

}
