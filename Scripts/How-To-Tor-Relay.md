# To Use the script

#### Install curl
sudo apt-get install curl -y

#### Download the script
curl https://raw.githubusercontent.com/randomtable/ChimeraOS/master/Scripts/Tor-Relay.sh --output Tor-Relay.sh

#### Set execution permissions:
chmod +x ./Tor-Relay.sh

#### Run the script
sudo ./Tor-Relay.sh

#### Wait for completion and run Tor
tor

# Or try the pre-configured VM (this VM is an example. Please delete all Tor configurations and folders before use it definitively)
https://github.com/randomtable/ChimeraOS/raw/master/VMs/Tor-Relay.ova
