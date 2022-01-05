FROM cycloid/github-cli as downloader

ARG GH_TOKEN
ENV GH_TOKEN=$GH_TOKEN

WORKDIR /app

RUN gh release download --pattern "JMusicBot-*.jar" --repo jagrosh/MusicBot
RUN mv JMusicBot-*.jar JMusicBot.jar
RUN gh release download --pattern "ibm-semeru-open-jre_aarch64_linux_*.tar.gz" --repo ibmruntimes/semeru17-binaries

FROM ubuntu:latest

ENV JAVA_HOME=/opt/java/openjdk
ENV PATH="${JAVA_HOME}/bin:${PATH}"

WORKDIR /app

COPY --from=downloader /app/JMusicBot.jar /app/JMusicBot.jar
COPY --from=downloader /app/ibm-semeru-open-jre_aarch64_linux_*.tar.gz /app

RUN tar -xzf ibm-semeru-open-jre_aarch64_linux_*.tar.gz --one-top-level=openjdk --strip-components=1
RUN mv openjdk /opt/java

ENTRYPOINT ["java", "-Dconfig=/app/config.txt", "-Dnogui=true", "-jar", "/app/JMusicBot.jar"]