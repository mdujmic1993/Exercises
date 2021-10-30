# Readme

## 1.1 Install and configure Docker 

Installed Docker via Ansible using the convenience script and enabled containter logging to Docker host's syslog file. 
Site.yml does 4 things: 
1) Downloads the Docker convenience script
2) Installs Docker using the script
3) Sets up syslog logging for Docker by copying the daemon.json file to /etc/docker/
4) Restarts the Docker service for the configuration to take effect

NOTE TO SELF: Remember to add more cores to the VM host before installing stuff. 

![Exercise_1 1_pt1](https://user-images.githubusercontent.com/36381123/139537269-6be436a2-9a78-4c3a-aaf5-8158135077ac.png)
![Exercise_1 1_pt2](https://user-images.githubusercontent.com/36381123/139537274-5498bbd9-8f2c-4801-a454-c2eb8209e53b.png)



## 1.2 Write a weather reporting program

Installed the pyowm library, set up the environment variables, wrote and ran the script. 

Getweather imports __os__ to be able to use environment variables for the API key and city, and imports __OWM__ from the pyowm library, and __config__ and __timestamps__ from pyowm.utils. Then it proceeds to import the environment variables, create an owm manager, and pull the data for the desired city. 

![Exercise_1 2](https://user-images.githubusercontent.com/36381123/139537279-4b563891-c13c-4069-b3a8-417ceb87177d.png)



## 1.3 Dockerize and run the program 

Wrote the dockerfile, built the image and spun up the docker container. 

The container is built from Python's Alpine Linux container due to resource conservation. The dockerfile instructs Docker to copy the getweather script to the home directory, install the pyowm library and run the script. Docker sends the output of the script to /var/log/syslog. 

![Exercise_1 3](https://user-images.githubusercontent.com/36381123/139537288-43621de3-fec5-4dae-8726-1322ccdc8669.png)
