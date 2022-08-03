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
$ docker run --name tomcat rjsdnfk9/ksk_tomcat:1.0
```

## Running & Execute MySQL
```
$ docker run --name mysql rjsdnfk9/ksk_mysql:1.0
$ docker exec -it mysql /bin/bash
```

### In the MySQL Contatiner
```
$ mysql -u root -p
$ {private_password} 
$ use ksk;
$ select * from clothes;
```
### clothes table has 8 cols
category : t-shirts, neat_sweater, pants, shirts, ...  
brand : <clothes' brand>  
name : <clothes' name>  
img : <clothes' image>  
price : <clothes' price>  
stock : <# of clothes>  
color : <clothes' color>  
readcount : <count of clothes' readcount>  

