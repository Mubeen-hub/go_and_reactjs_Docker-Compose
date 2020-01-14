Master branch contains client and server
client contain Dockerfile which will download required image for React-js from docker hub and expose port 80
it also contains package.json in which i have changed defualt 3000 port to 80 and App.js inside inside src folder which fetch 
data through api made by go lang

server contain Dockerfile which will download required image for golang from docker hub and expose port to 8080
it also contains main.go which will create api for client 

docker-compose.yml will use both client and server Dockerfile to run them on same docker virtual network at once
to run all this simply run  <br>
<b> docker-compose up <b>
