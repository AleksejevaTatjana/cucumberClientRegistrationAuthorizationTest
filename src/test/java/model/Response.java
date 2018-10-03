package model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Response {

    @JsonProperty("Result")
    private boolean result;
    @JsonProperty("Details")
    private String details;

    public boolean getResult() {
        return result;
    }

    public void setResult(boolean result) {
        this.result = result;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }
}

