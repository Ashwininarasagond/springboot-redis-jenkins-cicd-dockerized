# Use OpenJDK 17 as base image
FROM eclipse-temurin:17-jdk-alpine

# Set working directory inside container
WORKDIR /app

# Copy the Spring Boot jar (wildcard handles dynamic jar names)
COPY target/*.jar app.jar

# Expose application port
EXPOSE 8084

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

