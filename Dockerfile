FROM maven:3.8.1-jdk-8
WORKDIR /home/app
COPY ./target /home/app/target
EXPOSE 8080
CMD ["sleep","100"]
#ENTRYPOINT ["java","-jar","/home/app/target/*.jar"]
