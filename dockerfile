FROM eclipse-temurin:21-jdk AS builder
WORKDIR /app

COPY . .

# Compilar sin tests
RUN ./mvnw -q -DskipTests package

FROM eclipse-temurin:21-jdk
WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
