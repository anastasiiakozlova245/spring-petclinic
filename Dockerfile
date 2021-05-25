FROM maven:3.8.1-openjdk-8
COPY .mvn /home/app
COPY mvnw /home/app/mvnw
COPY mvnw.cmd /home/app
COPY pom.xml /home/app
COPY src /home/app/src
COPY release.properties /home/app
WORKDIR /home/app
RUN ["mvn","clean","package","--no-transfer-progress"]
CMD ["java","-jar","target/*.jar"]

