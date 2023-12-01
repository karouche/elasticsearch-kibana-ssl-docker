
## How to start Elasticsearch & Kibana servers : 

  ```
     ./run-docker-compose.sh   
  ```

  and wait until the servers start.
   
 Not the settings are :  
  - SSL enabled    
  - Certificate file provided to the config folder certs in ES server . 
  - Truststore made available to Java Client (local docker/certs/ca)
  - Same certificate used for HTTP config TRANSPORT config.
    > HTTP is for the API that you would interact with.<br>
    > Transport is for inter-node communications. 

## Authentication on Elasticsearch and Kibana 

   Elasticsearch and kibana servers need theses credentials to reach theirs services:
   
#### Elasticsearch :    

     - Server URL: https://localhost:9200
     - Login : elastic
     - Password : elastic

#### Kibana :

     - Server URL: https://localhost:5601
     - Login : elastic
     - Password : elastic
  
 
###  Fix error : Bad interpreter : 
    If this error appears: ```Not able to execute a .sh file: /bin/bash^M: bad interpreter```  run: 
>  - dos2unix run-docker-compose.sh
or 
>  - sed -e "s/\^M//"  run-docker-compose.sh  > run-docker-compose.sh

  Notice :
  
>  - We can reuse the index already created, for this purpose: don't destroy the containers (`docker-compose down`), use `docker-compose stop ` to stop and and `docker-compose start ` to (re)start. `.  
 