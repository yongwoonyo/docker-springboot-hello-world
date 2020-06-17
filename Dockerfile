FROM maven:3.5.2-jdk-8-alpine AS maven_build
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package

FROM openjdk:8-jdk-alpine

CMD java -jar /data/docker-test-0.0.1-SAMPLE.jar
COPY --from=maven_build /tmp/target/docker-test-0.0.1-SAMPLE.jar /data/docker-test-0.0.1-SAMPLE.jar

EXPOSE 8080


MAINTAINER Roy Lee yongwoonyo@gmail.com

