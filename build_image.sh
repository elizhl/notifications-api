docker rm -f elizhl/notifications-api

docker rmi elizhl/notifications-api

docker image prune -f

docker volume prune -f

docker build -t elizhl/notifications-api .

docker tag elizhl/notifications-api elizhl/notifications-api

docker push elizhl/notifications-api