# basic-backend-app

<img width="814" alt="Screen Shot 2020-06-26 at 11 39 24" src="https://user-images.githubusercontent.com/51725996/85880647-f9fdd100-b7a1-11ea-9d09-ac6a01f44c7d.png">

Clone the project

Create a virtualenv then run

    pip install requirements.txt
    flask run
    

If you prrefer you can use the docker image

    docker pull elizhl/notifications-api
    docker build -t notifications-api:latest .
    docker run -p 5000:5000 notificcations-api
    
Go to http://0.0.0.0:8000

Done!
