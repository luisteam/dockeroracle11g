# dockeroracle11g

incluir los zip de oracle en oracle-ee-11g-base/database

linux.x64_11gR2_database_?of2.zip

cd oracle-11g-ee-base

sudo docker build -t sath89/oracle-ee-11g-base:latest .

cd ..

sudo docker build -t sath89/oracle-ee-11g .


docker run -d -p 8080:8080 -p 1521:1521 sath89/oracle-ee-11g

docker run -d -p 8080:8080 -p 1521:1521 -v /my/oracle/data:/u01/app/oracle sath89/oracle-ee-11g

hostname: localhost 
port: 1521 
sid: EE 
service name: EE.oracle.docker 
username: system 
password: oracle 

http://localhost:8080/em 
user: sys 
password: oracle 
connect as sysdba: true 
