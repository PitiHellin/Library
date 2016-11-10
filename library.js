.pragma library

Qt.include("socketParser.js");

// variables
var baseUrl = 'http://127.0.0.1:1337';

var accessToken = '';

var people=[{
              "name":"Lucia",
              "age":24
            },
            {
              "name":"Ricardo",
              "age":31
            },
            {
              "name":"Petro",
              "age":42
            },
            {
              "name":"Claudia",
              "age":23
            },
            {
              "name":"Mohamed",
              "age":45
            },
            {
              "name":"Romina",
              "age":63
            }];



// Function to call an HTTP REQUEST
function doHttpRequest(method, path, data, callback) {
    var xhr = new XMLHttpRequest;
    var uri = baseUrl + path;
    var queryString = "";

    // populate query string on GET request
    if (data && method === "GET") {
        for (var i in data) {
            queryString += "&" + i + "=" + data[i];
        }
        uri += "?q=1" + queryString;
    }

    // config http request
    xhr.open(method, uri, true);
    //console.log("Token used for request: " + accessToken)
    xhr.setRequestHeader("authorization", "Bearer " + accessToken);

    // listen to http response
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            var response = xhr.responseText;

            var responseCode = xhr.status;

            console.log("Status code from http response: "+responseCode)

            // If HTTP response is not 200, it's an error
            if (responseCode !== 200)
            {
                console.log("Http error ("+path+"): "+responseCode);

                try
                {
                    var responseFromHttp = JSON.parse(response)
                    console.log("Error response:",response)

                    return callback(responseFromHttp,null);
                }

                catch(e)
                {
                    var errorResponse =
                    {
                        "message":"Internal error."
                    }
                    return callback(errorResponse,null);
                }
            }

            // If HTTP response if 200, SUCCESS
            else
            {
                // If callback function was provided, we call it with the response
                if (callback)
                {
                    return callback(null, response);
                }

            }
        }
    }

    // perform http request "GET"
    if (method === "GET") {
        xhr.send();
    }
    else {

            xhr.setRequestHeader("Content-type", "application/json");
            xhr.setRequestHeader("Content-length", data.length);
            xhr.send(data);
    }
}


// Here you have to implement a function to return hello
function hello()
{

    return "world"
}


// THE FOLLOWING FUNCTIONS RETURN A JSON ARRAY



// Here you have to implement a function to get only the names of the people
function getPeopleNames()
{
    var newArrayNames = new Array();
    for (var i = 0; i<people.length; i++){

        newArrayNames[i] = people[i].name;

    }

    return newArrayNames;
    // It should return ["Lucia", "Ricardo", "Petro", ... etc]
}

// Here you have to implement a function to get only the age of the people (
function getPeopleAges()
{

    var newArrayAges = new Array();
    for (var i = 0; i<people.length; i++){
        newArrayAges[i] = people[i].age;
    }

    return newArrayAges;

    // It should return [23, 31, 42, etc]
}

// Here you have to implement a function to get ALL the people with all their information (name and age)
function getAllPeople()
{
    return people;
    // It should return [{"name":"Lucia","age":24},{"name":"Ricardo","age":31},{"name":"Petro","age":42},{"name":"Claudia","age":23},{"name":"Mohamed","age":45},{"name":"Romina","age":63}]
}

// Here you have to implement a function to get only the people who are above 30 years old (name and age)
function getOldPeople()
{
    var newArrayOld = new Array();
    for (var i = 0; i<people.length; i++){
        if(people[i].age > 30){
            newArrayOld.push(people[i]);
        }
    }
    console.log(newArrayOld)
    return newArrayOld;

    // It should return the same as above but only the old people
}
