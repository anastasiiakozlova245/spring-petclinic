FROM maven:3.8.1-jdk-8
WORKDIR /home/app
COPY ./target /home/app/
EXPOSE 8080
USER root
CMD java -jar *.jar
