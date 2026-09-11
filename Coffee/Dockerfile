FROM eclipse-temurin:26-jdk-alpine AS build 
WORKDIR /app
COPY . .
RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests
FROM eclipse-temurin:26-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/Coffee-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]