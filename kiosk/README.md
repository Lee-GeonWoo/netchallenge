# Kiosk Service

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
```
RELEASE-NOTES.txt  bg-button.png  bg-upper.png  brown.jsp   favicon.ico  img                map.jsp           orange.jsp       purple.jsp  tomcat.css   white.jsp
WEB-INF            bg-middle.png  black.jsp     css         green.jsp    ip.txt             navy.jsp          pants_skirt.jsp  red.jsp     tomcat.svg   yellow.jsp
asf-logo-wide.svg  bg-nav.png     blue.jsp      detail.jsp  grey.jsp     jumper_hoodie.jsp  neat_sweater.jsp  pink.jsp         shirts.jsp  tshirts.jsp  
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
