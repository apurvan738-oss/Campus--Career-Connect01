# Build the Spring Boot application with Java 17 and Maven.
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /workspace
COPY pom.xml .
COPY src ./src
RUN mvn -B -DskipTests package

# Run using a smaller Java 17 runtime image.
FROM eclipse-temurin:17-jre
WORKDIR /app
ENV PORT=3000
COPY --from=build /workspace/target/student-placement-management-system-1.0.0.jar app.jar
EXPOSE 3000
ENTRYPOINT ["sh", "-c", "java -jar /app/app.jar --server.port=${PORT:-3000}"]
