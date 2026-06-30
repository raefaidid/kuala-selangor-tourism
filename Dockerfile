# Stage 1: compile and package the WAR
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app

# Cache dependencies separately from source so rebuilds are faster
COPY pom.xml .
COPY .mvn/ .mvn/
RUN mvn dependency:go-offline -B

# Build the WAR
COPY src/ src/
RUN mvn clean package -DskipTests -B

# Stage 2: run on Tomcat 10.1 (Jakarta EE 10 / Servlet 6.0)
FROM tomcat:10.1-jdk17-temurin

# Remove default Tomcat sample app, deploy ours as ROOT (serves from /)
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY --from=build /app/target/tourism-kuala-selangor.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
