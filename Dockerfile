# Use a base image with Java and Node.js
FROM adoptopenjdk:11-jre-hotspot AS java_node_base

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Set the working directory
WORKDIR /app

# Copy the necessary files into the container
COPY start.sh /app/start.sh
COPY Lavalink.jar /app/Lavalink.jar
COPY index.js /app/index.js
COPY application.yml /app/application.yml

# Grant execute permissions to the script
RUN chmod +x /app/start.sh

# Expose port 443
EXPOSE 443

# Start the script
CMD ["/app/start.sh"]
