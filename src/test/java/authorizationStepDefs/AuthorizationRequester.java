package authorizationStepDefs;

import model.AuthorizationClient;
import model.Response;
import org.springframework.web.client.RestTemplate;

public class AuthorizationRequester {

    private final String URL = "http://207.154.242.0:8888/v1/authorize";

    public Response register(AuthorizationClient authorizationClient) {
        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.postForEntity(URL, authorizationClient, Response.class).getBody();
    }
}


