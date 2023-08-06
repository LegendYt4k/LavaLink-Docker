# Use a base image with Java
FROM adoptopenjdk:11-jre-hotspot

# Set the working directory
WORKDIR /app

# Copy the necessary files into the container
COPY start.sh /app/start.sh
COPY Lavalink.jar /app/Lavalink.jar
COPY index.js /app/index.js
COPY application.yml /app/application.yml

# Expose port 443 (if Lavalink uses it)
EXPOSE 443

# Start Lavalink
CMD ["java", "-jar", "Lavalink.jar"]