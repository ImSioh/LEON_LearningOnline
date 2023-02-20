package dto;

import java.util.UUID;

public class Question {

    private UUID questionId;
    private String title;
    private String content;

    public Question(UUID questionId, String title, String content) {
        this.questionId = questionId;
        this.title = title;
        this.content = content;
    }

    public UUID getQuestionId() {
        return questionId;
    }

    public void setQuestionId(UUID questionId) {
        this.questionId = questionId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Question(" + String.join(", ", new String[]{
            questionId.toString(),
            content
        }) + ")";
    }

    @Override
    public boolean equals(Object obj) {
        Question question = (Question) obj;
        return question.questionId.equals(this.questionId);
    }

}
