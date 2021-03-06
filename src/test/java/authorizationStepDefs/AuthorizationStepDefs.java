package authorizationStepDefs;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import model.AuthorizationClient;
import model.Response;
import org.junit.Assert;

import java.io.IOException;
import java.util.Map;

public class AuthorizationStepDefs {
    private AuthorizationClient authorizationClient = new AuthorizationClient();
    private Response response = new Response();
    private AuthorizationRequester requester = new AuthorizationRequester();

    @Given("client")
    public void set_client(Map<String, String> data) {
        authorizationClient.setLogin(data.get("login"));
        authorizationClient.setPwd(data.get("pwd"));
    }

    @When("we authorize client")
    public void get_client() throws IOException {
        response = requester.authorize(authorizationClient);
    }

    @Then("response is")
    public void check_response(Map<String, String> data) {
        Assert.assertEquals("incorrect result", Boolean.valueOf(data.get("result")), response.getResult());
        Assert.assertEquals("incorrect details", data.get("details"), response.getDetails());
    }
}


