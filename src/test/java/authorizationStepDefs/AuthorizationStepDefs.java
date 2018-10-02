package authorizationStepDefs;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import model.AuthorizationClient;
import model.Response;
import org.junit.Assert;

import java.util.Map;

public class AuthorizationStepDefs {
    private AuthorizationClient authorizationClient = new AuthorizationClient();
    private Response response = new Response();
    private AuthorizationRequester requester = new AuthorizationRequester();

    @Given("client:")
    public void set_clientLogin(Map<String, String> data) {
        authorizationClient.setLogin(data.get("login"));
        authorizationClient.setPwd(data.get("pwd"));
    }

    @When("we authorize the client")
    public void get_clientLogin() {
        response = requester.register(authorizationClient);
    }

    @Then("login response is:")
    public void check_responseLogin(Map<String, String> data) {
        Assert.assertEquals("incorrect result", data.get("result"), response.getResult());
        Assert.assertEquals("incorrect details", data.get("details"), response.getDetails());
    }


    @Given("client")
    public void set_clientPwd(Map<String, String> data) {
        authorizationClient.setLogin(data.get("login"));
        authorizationClient.setPwd(data.get("pwd"));
    }

    @When("we authorize the client")
    public void get_clientPwd() {
        response = requester.register(authorizationClient);
    }

    @Then("password response is:")
    public void check_responsePwd(Map<String, String> data) {
        Assert.assertEquals("incorrect result", data.get("result"), response.getResult());
        Assert.assertEquals("incorrect details", data.get("details"), response.getDetails());
    }
}


