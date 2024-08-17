FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-21-jdk -y

COPY . .

RUN ./gradlew clean build -x test

FROM luizhcanassa/ubuntu-openjdk-21:latest
LABEL authors="luiz-henrique-canassa"

EXPOSE 8080

COPY --from=build /build/libs/teste-spring-boot-render-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]