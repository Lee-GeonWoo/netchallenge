# Kiosk User Interface

## Prerequisite
> Docker  
  
### Install Docker
```
$ apt update
$ apt install docker.io -y
```

### Image Pulling
```
docker pull rjsdnfk9/ksk_tomcat:1.0
docker pull rjsdnfk9/ksk_mysql:1.0
```

### Running Tomcat
```
$ docker run --name tomcat rjsdnfk9/ksk_tomcat:1.0
```

#### (Optional) In the Tomcat Contatiner
Check JSP files
```
$ docker exec -it mysql /bin/bash
$ cd webapps/ROOT/
$ ls
```

### Running MySQL
```
$ docker run --name mysql rjsdnfk9/ksk_mysql:1.0
```

#### (Optional) In the MySQL Contatiner
Check table data
```
$ docker exec -it mysql /bin/bash
$ mysql -u root -p              # Login
$ {private_password} 
$ use ksk;                      # Use ksk(kiosk) databases
$ select * from clothes;        # Check clothes table
```
#### ※ clothes table has 8 cols
<b>category</b> : t-shirts, neat_sweater, pants, shirts, ...  
<b>brand</b> : <clothes' brand>  
<b>name</b> : <clothes' name>  
<b>img</b> : <clothes' image>  
<b>price</b> : <clothes' price>  
<b>stock</b> : <# of clothes>  
<b>color</b> : <clothes' color>  
<b>readcount</b> : <# of clothes' readcount>  

