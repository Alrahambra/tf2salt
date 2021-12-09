# tf2salt - Team Fortress 2 Server Deploy with Salt!

The meaning of this project is to provide orchestrated way to provision and prepare an instance to be ready and execute the SteamCMD binary, which then is used to download, and update the required resources to provision the server. 

## State and TODO

- More documentation and testing should be done
- Configuration should be made easier, if possible
- At the moment, based on Vagrant deployed testing it should be possible to deploy this on a freshly installed CentOS 8.3 server without any issues
- More official Steam support could be added, if wanted
- More usage instructions on how to run on minion
- Attempt to implement autoupdate on startup to minimize maintenance
- modify service-file further to handle restarts better
- publish Vagrantfile for testing as well


## Deployment

- Deploy a fresh Centos 8.X series server
- Configure the instance to be a SaltStack minion
- Before applying the state, run configurator.py to create server.cfg or just instead add a server.cfg file with your own requirements. It is untracked and ignored by the .gitignore system
- Apply state
- Execute: systemctl start tf2server

## System requirements

During testing it was found, that the following system requirements should suffice. It should be noted that this project is designed to be ran with CentOS 8.3.

- 3 vCPU/CPU
- 4096 MB of RAM
- At least 25 GB of disk space

## Screenshots

TBA