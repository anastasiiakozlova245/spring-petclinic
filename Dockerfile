FROM maven:3.8.1-jdk-8
WORKDIR /home/app
COPY ./target /home/app/target
EXPOSE 8080
USER root
#CMD ["sleep","100"]
CMD ["bash","-c","java","-jar","/home/app/target/*.jar"]
