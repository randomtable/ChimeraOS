# Welcome to my project!

### This project aims to make easier for users to deploy their own Tor Relays and Tor Hidden Services with Docker.

In the first section, i will explain the Tor Relay image, how to use and how to run easily your first Tor Relay.
The second section is dedicated to run your hidden service with released images of the OS (formerly the ChimeraOS).

For now, as i am working on Windows, i will explain the use of images from Windows platform.

Very soon, i will release in the sections, the use of images and explain them for Ubuntu users.

For Docker reference, please visit the official guide:

https://docs.docker.com/get-started/

# Section 1: Tor-Relay
## Link to the image: https://hub.docker.com/r/alessandrofiori/tor-relay
### Docker command to pull the image: "docker pull alessandrofiori/tor-relay"

This image is intended for who want to run a Tor Exit Relay easily.

#### What's in this image?

This image is derived from the official ubuntu image.

In this image you can find the ubuntu base packages, the Tor package, and a modified torrc file for enable an Exit Relay.

#### How to use this image?
