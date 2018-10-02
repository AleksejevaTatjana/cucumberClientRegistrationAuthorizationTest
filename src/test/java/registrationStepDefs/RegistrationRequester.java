package registrationStepDefs;

import model.RegistrationClient;
import model.Response;
import org.springframework.web.client.RestTemplate;

public class RegistrationRequester {

    private final String URL = "http://207.154.242.0:8888/v1/register";

    public Response register(RegistrationClient registrationClient) {
        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.postForEntity(URL, registrationClient, Response.class).getBody();

    }
}
