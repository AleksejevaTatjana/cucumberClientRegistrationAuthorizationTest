package registrationStepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import model.Address;
import model.RegistrationClient;
import model.Response;
import org.junit.Assert;

import java.text.ParseException;
import java.util.Map;

public class RegistrationStepDefs {
    private RegistrationClient registrationClient = new RegistrationClient();
    private Response response = new Response();
    private RegistrationRequester requester = new RegistrationRequester();

    public RegistrationStepDefs() throws ParseException {
    }

    @Given("login client:")
    public void set_clientCheckingLogin(Map<String, String> data) {
        registrationClient.setLogin(data.get("login"));
        registrationClient.setEmail(data.get("email"));
        registrationClient.setPhone(data.get("phone"));
        registrationClient.setPhone(data.get("pwd"));
        registrationClient.setPhone(data.get("birthDate"));
        registrationClient.setPhone(data.get("description"));
    }

    @Given("login address is:")
    public void set_addressCheckingLogin(Map<String, String> data) {
        Address address = new Address();
        address.setCountry(data.get("country"));
        address.setCity(data.get("city"));
        address.setState(data.get("state"));
        address.setZip(data.get("zip"));
        address.setStreet(data.get("street"));
    }

    @When("we register login client:")
    public void get_clientLogin() {
        response = requester.register(registrationClient);
    }

    @And("we register login client again:")
    public void get_clientDataCheckingLoginAgain() {
        response = requester.register(registrationClient);
    }

    @Then("login response is:")
    public void check_responseLogin(Map<String, String> data) {
        Assert.assertEquals("incorrect result", data.get("result"), response.getResult());
        Assert.assertEquals("incorrect details", data.get("details"), response.getDetails());
    }


    @Given("password client:")
    public void set_clientCheckingPwd(Map<String, String> data) {
        registrationClient.setLogin(data.get("login"));
        registrationClient.setEmail(data.get("email"));
        registrationClient.setPhone(data.get("phone"));
        registrationClient.setPhone(data.get("pwd"));
        registrationClient.setPhone(data.get("birthDate"));
        registrationClient.setPhone(data.get("description"));
    }

    @Given("password address is:")
    public void set_addressCheckingPwd(Map<String, String> data) {
        Address address = new Address();
        address.setCountry(data.get("country"));
        address.setCity(data.get("city"));
        address.setState(data.get("state"));
        address.setZip(data.get("zip"));
        address.setStreet(data.get("street"));
    }

    @When("we register the client with password")
    public void get_clientDataCheckingPwd() {
        response = requester.register(registrationClient);
    }

    @Then("pwd response is:")
    public void check_responsePwd(Map<String, String> data) {
        Assert.assertEquals("incorrect result", data.get("result"), response.getResult());
        Assert.assertEquals("incorrect details", data.get("details"), response.getDetails());
    }


    @Given("age client:")
    public void set_clientCheckingBirthday(Map<String, String> data) {
        registrationClient.setLogin(data.get("login"));
        registrationClient.setEmail(data.get("email"));
        registrationClient.setPhone(data.get("phone"));
        registrationClient.setPhone(data.get("pwd"));
        registrationClient.setPhone(data.get("birthDate"));
        registrationClient.setPhone(data.get("description"));
    }

    @Given("age client address is:")
    public void set_addressCheckingBirthday(Map<String, String> data) {
        Address address = new Address();
        address.setCountry(data.get("country"));
        address.setCity(data.get("city"));
        address.setState(data.get("state"));
        address.setZip(data.get("zip"));
        address.setStreet(data.get("street"));
    }

    @When("we register age client")
    public void get_clientDataCheckingBirthday() {
        response = requester.register(registrationClient);
    }

    @Then("age response is:")
    public void check_responseBirthday(Map<String, String> data) {
        Assert.assertEquals("incorrect result", data.get("result"), response.getResult());
        Assert.assertEquals("incorrect details", data.get("details"), response.getDetails());
    }


    @Given("description client:")
    public void set_clientCheckingDescription(Map<String, String> data) {
        registrationClient.setLogin(data.get("login"));
        registrationClient.setEmail(data.get("email"));
        registrationClient.setPhone(data.get("phone"));
        registrationClient.setPhone(data.get("pwd"));
        registrationClient.setPhone(data.get("birthDate"));
        registrationClient.setPhone(data.get("description"));
    }

    @Given("description client address is:")
    public void set_addressCheckingDescription(Map<String, String> data) {
        Address address = new Address();
        address.setCountry(data.get("country"));
        address.setCity(data.get("city"));
        address.setState(data.get("state"));
        address.setZip(data.get("zip"));
        address.setStreet(data.get("street"));
    }

    @When("we register description client:")
    public void get_clientDataCheckingDescription() {
        response = requester.register(registrationClient);
    }

    @Then("description response is:")
    public void check_responseDescription(Map<String, String> data) {
        Assert.assertEquals("incorrect result", data.get("result"), response.getResult());
        Assert.assertEquals("incorrect details", data.get("details"), response.getDetails());
    }
}


