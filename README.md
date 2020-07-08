# basic-backend-app

<img width="814" alt="Screen Shot 2020-06-26 at 11 39 24" src="https://user-images.githubusercontent.com/51725996/85880647-f9fdd100-b7a1-11ea-9d09-ac6a01f44c7d.png">

Clone the project

Create a virtualenv then run

    pip install requirements.txt
    flask run
    

If you prrefer you can use the docker image

    docker pull elizhl/notifications-api
    docker build -t notifications-api:latest .
    docker run -p 8000:8000 notifications-api
    
Go to http://0.0.0.0:8000


### Consul template

We are gonna need to install consul-template in our container and the certs to connect with consul. (/files/bin and /files/certs)

Change your Dockerfile to add a pre-start and add the variables to connect witth consul. 
In your pre-start script you should add the validations for yourr variables such as ssl, token and CMD_command if this need to be changed

Then got to you startProcess script and do the validations again and then execute te consul-template command, as you can see you need a template consul-template with the structure of your json file that json file will be the one who feed your toggle feature

With {{ key "path" }} consul already know you are asking for a variable in the kv store so when you run the consul-template command it goes to the template read the line and make an http call to the consul server to get the value for that key

Then your app is going to start normally

If you go inside the container you will see the json file populated with the right values.

Use that value to enable/disable your features

Done!
