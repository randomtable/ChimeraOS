# Welcome to my project!

### Section 0: Project - Distributed IRC Server (starting Hidden Communication Protocol Project)
##### This Section is a draft and all theory, please open an issue if there is errors or discussion!

If you want to sustain me in this project, soon i will publish a donation link.

Below of this section, there is other solutions and Docker images/VMs

This Project aims to provide a distributed IRC service, for private communication.

The model is simple, but effective.

This is the first step of my Hidden Communication Protocol (HCP), a protocol for a distributed and high availability communication, based on Tor Network.

The idea is to extend the Hidden Service and Tor Network model to Hidden Service, with Docker.

Docker is a great tool: with Dockerfile you can make always the same image, with the latest available packages, and the distribution of the image is simple too.

I have studied some solutions to load-balancing the Network, but i have spotted some flaws.

Thinking of a adversary, if you setup a load balancer or replicas, you have to protect your relays, or your master relay on the Network in the same way, and you have to add more complex countermeasures and layers to protect all your sub-network.

In theory, an adversary have to hack into one node of your network, for capture all network information.

The solution can be simpler, compared to a load balancer, but not the simplest.

The idea is to distribute a pre-configured hidden service, in VM or Docker image, to have the same service on all nodes.

With this solution, a user can connect to the last hidden service which have uploaded its descriptor to the DHT, so the users randomly connects to a service transparently.

Advantages:

This method can be an advantage because an adversary have to break all nodes which runs the service, having partial informations too, because the adversary doesn't know the user have been connected.

This method have a disadvantage too: the service configurations and software versions.

Servers have to run the same services with the same configurations, because a change can disrupt the service.

This model doesn't cover Databases, in the "cloud" model, a Database can't be in a container, or within the network.

The database have to be separated, so in a data-driven application, the number of servers will be: N+1 or N+N, where there is Database replicas outside the central network.

The results can be visible in the "torworld-irc" image:

https://hub.docker.com/r/alessandrofiori/torworld-irc

This image contains an inspircd server, plus a TheLounge IRC Client.

The current version (hidden service link) is:

http://ks2dgiax57br7quz7zkrquo7tqhxpfl5bgcuuzxyq47lbfsngwk6bwid.onion:9000

This is a v3 Hidden Service

As you can see from Dockerfile:

https://github.com/randomtable/ChimeraOS/blob/master/DockerFile-IRC-Server

You have an IRC server, which can be connected only from TheLounge, plus TheLounge has no users.

You have to pull the image, then run the image, then create manually the first user.

This is for prevent abuses (the IRC Client is a REAL IRC Client, so you can connect on any IRC Network from link above.

If a group of people want to stay connected and create a robust network, have to modify the Dockerfile to fit their needs and distribute the same image.

When all pieces are in place, the clients can access the multiple nodes of the sub-network, in base of which server has published its descriptor.

### Below section aims to make easier for users to deploy their own Tor Relays and Tor Hidden Services with Docker.

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

The simplest way to use this image is pulling it from Docker Hub, using the script "tor-relay-starter.bat"

The script will pull the image, create a container for it and run immediatly a Relay.

The full script:

docker pull alessandrofiori/tor-relay

docker create alessandrofiori/tor-relay:latest

docker run -p 9001:9001 alessandrofiori/tor-relay:latest

#### You can also use the Dockerfile to build your own image.

# Tor-Non-Exit-Relay
## Link to the image: https://hub.docker.com/r/alessandrofiori/tor-non-exit-relay
### Docker command to pull the image: "docker pull alessandrofiori/tor-non-exit-relay"

This image is intended for who want to run a Tor Non-Exit Relay easily.

#### What's in this image?

This image is derived from the official ubuntu image.

In this image you can find the ubuntu base packages, the Tor package, and a modified torrc file for enable a Non-Exit Relay.

#### How to use this image?

The simplest way to use this image is pulling it from Docker Hub, using the script "tor-middle-relay-starter.bat"

The script will pull the image, create a container for it and run immediatly a Relay.

The full script:

docker pull alessandrofiori/tor-non-exit-relay

docker create alessandrofiori/tor-non-exit-relay:latest

docker run -p 9001:9001 alessandrofiori/tor-non-exit-relay:latest

#### You can also use the Dockerfile to build your own image (you can see the configuration is essentially a Tor Relay configuration with command for uncomment the line "ExitRelay 0".


# Section 2: Tor-World (ChimeraOS)
## Link to the image: https://hub.docker.com/r/alessandrofiori/torworld-template
### Docker command to pull the image: "docker pull alessandrofiori/torworld-template"

This image is intended for who want to deploy a complete solution with Hidden Service, Relay (decide the "scope"), a web server and MySQL.

#### What's in this image?

This image is derived from the official ubuntu image.

In this image you can find the ubuntu base packages, the Tor package, a modified torrc file with configurations, a XAMPP installation with Apache, PHP and MySQL.

#### How to use this image?

The simplest way to use this image is pulling it from Docker Hub, using the script "torworld-starter.bat"

The script will pull the image, create a container for it and run immediatly an entire ubuntu system with Tor Hidden Service, an Exit Relay (because of this, i have named this image "template"), an Apache + PHP + MySQL instance.

The full script:

docker pull alessandrofiori/torworld-template

docker create alessandrofiori/torworld-template:latest

docker run alessandrofiori/torworld-template:latest

#### You can also use the Dockerfile to build your own image.

# Section 3: Tor-Relay (Script + VM)
## Link to the image: https://github.com/randomtable/ChimeraOS/blob/master/VMs/Tor-Relay.ova
### Script to replicate on your system: https://github.com/randomtable/ChimeraOS/blob/master/Scripts/Tor-Relay.sh

This script + image, is intended for who want to run a Tor middle relay.

#### What's in this image?

This image contains a Ubuntu Command Line Installation from minimal ISO, and the latest Tor package from deb.torproject.org.

#### How to use this image?

The simplest way to use this image is download the OVA file and import in Virtualbox or run the script on your Ubuntu System.
