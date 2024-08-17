FROM luizhcanassa/ubuntu-openjdk-21:latest
LABEL authors="luiz-henrique-canassa"

RUN apt-get update
COPY . .

RUN ./gradlew clean build -x test

EXPOSE 8080

COPY /build/libs/teste-spring-boot-render-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]