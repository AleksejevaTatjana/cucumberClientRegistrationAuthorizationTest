package registrationStepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import model.Address;
import model.RegistrationClient;
import model.Response;
import org.junit.Assert;

import java.util.Map;

public class RegistrationStepDefs {
    private RegistrationClient registrationClient = new RegistrationClient();
    private Response response = new Response();
    private RegistrationRequester requester = new RegistrationRequester();

    @Given("client:")
    public void set_clientCheckingLogin(Map<String, String> data) {
        registrationClient.setLogin(data.get("login"));
        registrationClient.setEmail(data.get("email"));
        registrationClient.setPhone(data.get("phone"));
        registrationClient.setPhone(data.get("pwd"));
        registrationClient.setPhone(data.get("birthDate"));
        registrationClient.setPhone(data.get("description"));
    }

    @Given("address is:")
    public void set_addressCheckingLogin(Map<String, String> data) {
        Address address = new Address();
        address.setCountry(data.get("country"));
        address.setCity(data.get("city"));
        address.setState(data.get("state"));
        address.setZip(data.get("zip"));
        address.setStreet(data.get("street"));
    }

    @When("we register the client")
    public void get_clientLoginPwd() {
        response = requester.register(registrationClient);
    }

    @Then("response is:")
    public void check_responseLogin(Map<String, String> data) {
        Assert.assertEquals("incorrect result", data.get("result"), response.getResult());
        Assert.assertEquals("incorrect details", data.get("details"), response.getDetails());

    }

    @Then("we register client one more time")
    public void get_clientDataCheckingLoginAgain() {
        response = requester.register(registrationClient);
    }

    @And("response is:")
    public void check_responseLoginAgain(Map<String, String> data) {
        Assert.assertEquals("incorrect result", data.get("result"), response.getResult());
        Assert.assertEquals("incorrect details", data.get("details"), response.getDetails());
    }


    @Given("client:")
    public void set_clientCheckingPwd(Map<String, String> data) {
        registrationClient.setLogin(data.get("login"));
        registrationClient.setEmail(data.get("email"));
        registrationClient.setPhone(data.get("phone"));
        registrationClient.setPhone(data.get("pwd"));
        registrationClient.setPhone(data.get("birthDate"));
        registrationClient.setPhone(data.get("description"));

    }

    @Given("address is:")
    public void set_addressCheckingPwd(Map<String, String> data) {
        Address address = new Address();
        address.setCountry(data.get("country"));
        address.setCity(data.get("city"));
        address.setState(data.get("state"));
        address.setZip(data.get("zip"));
        address.setStreet(data.get("street"));
    }

    @When("we register the client")
    public void get_clientDataCheckingPwd() {
        response = requester.register(registrationClient);

    }

    @Then("response is:")
    public void check_responsePwd(Map<String, String> data) {
        Assert.assertEquals("incorrect result", data.get("result"), response.getResult());
        Assert.assertEquals("incorrect details", data.get("details"), response.getDetails());

    }

    @Then("we register client one more time")
    public void get_clientDataCheckingPwdAgain() {
        response = requester.register(registrationClient);
    }

    @And("response is:")
    public void check_responsePwdAgain(Map<String, String> data) {
        Assert.assertEquals("incorrect result", data.get("result"), response.getResult());
        Assert.assertEquals("incorrect details", data.get("details"), response.getDetails());
    }

    @Given("client")
    public void set_clientForCheckingBirthday(Map<String, String> data) {
        registrationClient.setLogin(data.get("login"));
        registrationClient.setEmail(data.get("email"));
        registrationClient.setPhone(data.get("phone"));
        registrationClient.setPhone(data.get("pwd"));
        registrationClient.setPhone(data.get("birthDate"));
        registrationClient.setPhone(data.get("description"));
    }

    @Given("client address is:")
    public void set_addressForCheckingBirthday(Map<String, String> data) {
        Address address = new Address();
        address.setCountry(data.get("country"));
        address.setCity(data.get("city"));
        address.setState(data.get("state"));
        address.setZip(data.get("zip"));
        address.setStreet(data.get("street"));
    }

    @When("we register user")
    public void get_clientDataCheckingBirthday() {
        response = requester.register(registrationClient);
    }

    @Then("response is:")
    public void check_responseBirthday(Map<String, String> data) {
        Assert.assertEquals("incorrect result", data.get("result"), response.getResult());
        Assert.assertEquals("incorrect details", data.get("details"), response.getDetails());
    }


    @Given("client")
    public void set_clientForCheckingDescription(Map<String, String> data) {
        registrationClient.setLogin(data.get("login"));
        registrationClient.setEmail(data.get("email"));
        registrationClient.setPhone(data.get("phone"));
        registrationClient.setPhone(data.get("pwd"));
        registrationClient.setPhone(data.get("birthDate"));
        registrationClient.setPhone(data.get("description"));
    }

    @Given("address is:")
    public void set_addressForCheckingDescription(Map<String, String> data) {
        Address address = new Address();
        address.setCountry(data.get("country"));
        address.setCity(data.get("city"));
        address.setState(data.get("state"));
        address.setZip(data.get("zip"));
        address.setStreet(data.get("street"));
    }

    @When("we register user")
    public void get_clientDataCheckingDescriprion() {
        response = requester.register(registrationClient);
    }
    @Then("response is:")
    public void check_responseDescription(Map<String, String> data) {
        Assert.assertEquals("incorrect result", data.get("result"), response.getResult());
        Assert.assertEquals("incorrect details", data.get("details"), response.getDetails());
    }

}


