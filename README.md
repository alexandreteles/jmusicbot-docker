[![Build](https://github.com/alexandreteles/jmusicbot_docker/actions/workflows/main.yml/badge.svg)](https://github.com/alexandreteles/jmusicbot_docker/actions/workflows/main.yml) 

Simple docker image for the JMusicBot (a music bot for Discord) based on eclipse-temurin because we want fast security patches in case another log4j nightmare happens, without having to move Faster Than Light™ to change the Dockerfile.

Make sure to check the Dockerfile and the workflow before using it. All builds on DockerHub come from this repository using GitHub Actions, so you can check what is being added to the image (literally just the JMusicBot.jar file, but you should still check).

Make sure you provide a `config.txt` file or the bot will not start, obviously. The image expects it to be on `/app/config.txt` so just add `-v /path/to/config.txt:/app/config.txt:ro` and you should be good to go. This image may or may not be updated to use environment variables, probably not.

This image and it's building process are proudly licensed under the **DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE**.
