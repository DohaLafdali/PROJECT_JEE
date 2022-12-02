var wsURI = "ws://" + document.location.host + document.location.pathname + "/chat";
var wsURI="ws://localhost:8080/PROJECT_JEE/chat";
console.log(wsURI);
var websocket = new WebSocket(wsURI);

websocket.onmessage = function(evnt) {
    onMessage(evnt);
};

websocket.onopen = function()  {
    onOpen();
};

function onOpen() {
    console.log("Opened connection: " + wsURI);
}

function onClose() {
    console.log("Closed connection: " + wsURI);
}

function onMessage(event) {
    console.log(event);
    display(event.data);
}

function display(dataString) {
    var data = JSON.parse(dataString);
    var contentMessage = "<p>User " + data.from_user + " says: " + data.content + "</p>";
    document.getElementById("output").innerHTML += contentMessage + "</br>";
}

function send() {
	
	
    var message = document.getElementById("message_input").value;
    var username = document.getElementById("username_input").value;
    var json = {
        "content": message,
        "from_user": username
    };
    
    console.log("Sending " + username);
    websocket.send(JSON.stringify(json));
}