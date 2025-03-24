import ballerina/http;
import ballerina/io;
import ballerinax/ai.agent;

listener agent:Listener hrRagAgentListener = new (listenOn = check http:getDefaultListener());

service /hrRagAgent on hrRagAgentListener {
    resource function post chat(@http:Payload agent:ChatReqMessage request) returns agent:ChatRespMessage|error {
        string agentResponse = check llmChat(request.message);
        return {message: agentResponse};
    }
}

service /xxx on new http:Listener(8080) {
    resource function post yyy(@http:Payload agent:ChatReqMessage request) returns agent:ChatRespMessage|error {
        io:println("xxx");
        return {message: "xxx"};
    }
}
