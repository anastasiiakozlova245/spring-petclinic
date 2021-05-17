FROM maven:3.8.1-openjdk-8
COPY . /home/app
WORKDIR /home/app
RUN mvn clean package --no-transfer-progress
CMD ["sleep","2000"]
