FROM eclipse-temurin:latest
ADD https://github.com/jagrosh/MusicBot/releases/download/0.3.6/JMusicBot-0.3.6.jar /app/JMusicBot.jar
WORKDIR /app
ENTRYPOINT ["java", "-Dconfig=/app/config.txt", "-Dnogui=true", "-jar", "/app/JMusicBot.jar"]