# Stage 1: compile and package the WAR
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app

# Copy dependency descriptors first so this layer is cached unless pom.xml changes
COPY pom.xml .
COPY .mvn/ .mvn/
COPY mvnw .
RUN chmod +x mvnw && ./mvnw dependency:go-offline -B

# Copy source and build
COPY src/ src/
RUN ./mvnw clean package -DskipTests -B

# Stage 2: run on Tomcat 10.1 (Jakarta EE 10 / Servlet 6.0)
FROM tomcat:10.1-jre17-temurin-alpine

# Remove the default Tomcat sample app, deploy ours as ROOT (serves from /)
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY --from=build /app/target/tourism-kuala-selangor.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
