FROM maven:3.8.4-amazoncorrectto-8 AS BUILD
WORKDIR /app
COPY . /app
RUN cd /app && mvn install 

FROM openjdk:8-jdk-alpine
COPY --from=BUILD /app/target/spring-petclinic-2.7.0-SNAPSHOT.jar /
EXPOSE 8080
CMD [ "java", "-jar", "/spring-petclinic-2.7.0-SNAPSHOT.jar" ]