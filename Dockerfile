FROM maven:3.8.1-openjdk-8
WORKDIR /home/app
COPY ./target/*.jar /home/app
EXPOSE 8080
CMD ["java","-jar","./spring-petclinic-3.0.2-SNAPSHOT.jar"]
