FROM maven:3.8.1-jdk-8
WORKDIR /home/app
COPY ./target/*.jar /home/app
EXPOSE 8080
CMD ["sleep","100"]
#CMD ["java","-jar","./*.jar"]
