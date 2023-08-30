# Getting setup for ComSec


Most ComSec sessions are practical, so you'll need a system you're happy to hack on. We will run workshops in the labs as much as possible, so those machines will be available. If you're a more experience hacker, you no doubt have your own environment, however, if you're still getting into the area you may want a low-effort environment to start with. ComSec has built some tools to help with this.


## ComSec Vagrant Setup

For a completely hands-off approach to getting the latest Kali virtual machine and installing all the tools you'll need for a
standard ComSec session, this approach will suit you. 

Prerequisites:

A Windows or Linux machine with:

- Superuser privileges
- VMWare Player/Workstation/Workstation Pro or Virtualbox, capable of running VMs
- Approx 60GB of disk space. 
- A git client


### Installing Vagrant

1. Download the correct vagrant for your platform [here](https://developer.hashicorp.com/vagrant/downloads?product_intent=vagrant)
2. If you're using Virtualbox for virtualization, skip to [the next stage](#running-vagrant)
3. If on VMWare, download the VMWare vagrant utility for your platform [here](https://developer.hashicorp.com/vagrant/downloads/vmware) and run it
4. Install the vagrant plugin utility with the command `vagrant plugin install vagrant-vmware-desktop`
5. Restart the machine

### Setting up with Vagrant 

1. Clone the repository `git clone https://github.com/Cov-ComSec/ComSec-Kali-Deploy.git`
2. Navigate into the directory of `ComSec-Kali-Deploy`
3. Run `vagrant box update`
4. Run `vagrant up`

After a few seconds, you should see Virtualbox/VMWare open, and the terminal should begin outputting the results of installation. A successful installation will end with "Installation complete". The virtual machine will then reboot. The credentials to login are `kali:kali`.


