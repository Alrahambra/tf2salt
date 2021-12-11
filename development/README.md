# Deploying a test VM for Salt

It is possible to test this project locally with Vagrant without the need to e.g. deploy a cloud server for testing from time to time.

## Deploying

To deploy, have a Salt master ready for the instance and configure it's IP address in the Vagrantfile, and execute it with:

`vagrant up` 

Should you have the Virtualbox installed, you should in a few minutes have a fully updated CentOS 8.3 box with another host-only adapter (so you may connect to the game server for testing), 4096 MB of RAM and 3 vCPUs.

You need to also accept the key of the minion, with `salt-key -a` followed by the minion ID which will be ramdomly generated as seen in the Vagrantfile. 

You may want to specify an alternative source for the GPG file if you plan to use this file often. Remember that everything on the internet is based on trust.

## What now?

You may follow the main deployment instructions to apply states to this minion enabled machine.

## Destroying

After you're done with testing, you may issue:

`vagrant halt`

and after that

`vagrant destroy`

You may want to ensure you're destroying the correct machine by specifying the ID.