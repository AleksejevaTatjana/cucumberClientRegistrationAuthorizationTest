package registrationStepDefs;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import model.Address;
import model.RegistrationClient;
import model.Response;
import org.junit.Assert;

import java.io.IOException;
import java.text.ParseException;
import java.util.Map;
import java.util.UUID;

public class RegistrationStepDefs {

    private RegistrationClient registrationClient = new RegistrationClient();
    private Response response = new Response();
    private RegistrationRequester requester = new RegistrationRequester();

    @Given("client")
    public void set_client(Map<String, String> data) throws ParseException {
        if (data.get("email").equals("random")) {
            String randomMail = UUID.randomUUID().toString() + "@test.lv";
            registrationClient.setEmail(randomMail);
        } else {
            registrationClient.setEmail(data.get("email"));
        }
        registrationClient.setPhone(data.get("phone"));
        registrationClient.setPwd(data.get("pwd"));
        registrationClient.setBirthDate(data.get("birthDate"));
        registrationClient.setDescription(data.get("description"));
    }

    @Given("address is")
    public void set_address(Map<String, String> data) {
        Address address = new Address();
        address.setCountry(data.get("country"));
        address.setCity(data.get("city"));
        address.setState(data.get("state"));
        address.setZip(data.get("zip"));
        address.setStreet(data.get("street"));
        registrationClient.setAddress(address);
    }

    @When("we register client")
    public void get_client() throws IOException {
        response = requester.register(registrationClient);
    }

    @Then("response is")
    public void check_response(Map<String, String> data) {
        Assert.assertEquals("incorrect result", Boolean.valueOf(data.get("result")), response.getResult());
        Assert.assertEquals("incorrect details", data.get("details"), response.getDetails());
    }
}



