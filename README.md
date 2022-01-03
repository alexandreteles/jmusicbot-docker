[![License: WTFPL](https://img.shields.io/badge/License-WTFPL-brightgreen.svg)](http://www.wtfpl.net/about/)
![GitHub last commit](https://img.shields.io/github/last-commit/alexandreteles/jmusicbot_docker)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/alexandreteles/jmusicbot_docker/Build%20and%20push%20Docker%20image)

Simple docker image for the JMusicBot (a music bot for Discord). Based on [eclipse-temurin](https://hub.docker.com/_/eclipse-temurin) because we want fast security patches in case another log4j nightmare happens, without having to move Faster Than Light™ to change the Dockerfile or update the Java binaries in our system.

Make sure to check the Dockerfile and the build workflow before using it. All builds on DockerHub come from this repository using GitHub Actions, so you can check what is being added to the image (literally just the JMusicBot.jar file, but you should still check).

Make sure you provide a `config.txt` file or the bot will not start, obviously. The image expects it to be on `/app/config.txt` so just add `-v /path/to/config.txt:/app/config.txt:ro` and you should be good to go. This image may or may not be updated to use environment variables, probably not.

We scan our image builds for vulnerabilites using Trivy and Dependabot, so you can check the Security and Issues tabs to see if there's something bad going on and open an issue with us or fork it and fix it yourself (remember to push it upstream, aka us, pretty please).
