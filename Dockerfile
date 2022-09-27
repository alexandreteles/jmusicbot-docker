FROM cycloid/github-cli as downloader
ARG GH_TOKEN
ENV GH_TOKEN=$GH_TOKEN
WORKDIR /app
RUN gh release download --pattern "JMusicBot-*.jar" --repo jagrosh/MusicBot
RUN mv JMusicBot-*.jar JMusicBot.jar

FROM eclipse-temurin:19-jre-focal
COPY --from=downloader /app/JMusicBot.jar /app/JMusicBot.jar
WORKDIR /app
ENTRYPOINT ["java", "-Dconfig=/app/config.txt", "-Dnogui=true", "-jar", "/app/JMusicBot.jar"]
