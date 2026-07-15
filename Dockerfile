FROM maven:3.9-eclipse-temurin-8 AS build

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

FROM tomcat:latest

COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/app.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
