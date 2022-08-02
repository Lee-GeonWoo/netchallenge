# Kiosk User Interface

## Install Docker
```
$ apt update
$ apt install docker.io -y
```

## Image Pulling
```
docker pull rjsdnfk9/ksk_tomcat:1.0
docker pull rjsdnfk9/ksk_mysql:1.0
```

## Running & Execute tomcat
```
docker run --name tomcat rjsdnfk9/ksk_tomcat:1.0
```

## Running & Execute MySQL
```
docker run --name mysql rjsdnfk9/ksk_mysql:1.0
```
