# create-tomochain-masternode

This tool aims to help beginner/intermediate masternode owners.
It acts as a terminal wizard which helps the user generate a working configuration for docker-compose to run the node.

Using create-tomochain-masternode and docker-compose offers you benefits like:
- working "out of the box" docker-compose configuration
- auto-restarting your node on failure
- flexible configuration (storage, logging, ports)

## Prerequisites

  - Docker
  - Docker-compose

### Installation of Docker CE

To install Docker, first update the apt package index.
```
sudo apt update
```

Then install packages to allow apt to use a repository over HTTPS.
```
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

Add Docker’s official GPG key.
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Verify that you now have the key with the fingerprint `9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88`, by searching for the last 8 characters of the fingerprint.
```
apt-key fingerprint 0EBFCD88
```

Set up the stable Docker repository.
```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

Update the apt package index, then install the latest version of Docker CE.
```
sudo apt update

sudo apt install docker-ce
```

Once installed, add your current user to the Docker group.
```
usermod -aG docker $(whoami)
```
!!! warning
    You need to relog into your account for this to take effect.
    Until then, you will not be able to access the Docker deamon.

Verify that Docker CE is installed correctly by running the hello-world image:
```
docker run hello-world
```

This command downloads a test image and runs it in a container.
When the container runs, it prints an informational message starting by "Hello from Docker!" and exits.

### Installation of Docker-compose

To install docker-compose, start by downloading the executable.
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

Make it executable.
```
sudo chmod +x /usr/local/bin/docker-compose
```

Optional: install bash completion.
```
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.23.2/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
```

Verify that docker-compose is correctly installed by running the version command.
```
docker-compose version
```

## Installation

Download `create-tomochain-masternode` from the [latest release](https://github.com/tomochain/create-tomochain-masternode/releases/latest).

Make it executable.
```
chmod +x create-tomochain-masternode
```

Move it in your path.
```
mv create-tomochain-masternode /usr/local/bin/
```
## Usage

Simply run create-tomochain-masternode with the name of your masternode as argument.

```bash
create-tomochain-masternode mymasternode
```

Follow the wizard by replying to the following questions:

- **Coinbase private key**:
  Your masternode coinbase account private key.
  A TomoChain node uses an account to be uniquely identified and to receive transaction fee.

!!! note "Important note:"
    We advise for security measures to use a fresh new account for your masternode.
    This is not the account which will receive the rewards.
    The rewards are sent to the account which will make the initial deposit.

- **Storage**:
  The storage location for your node data (chaindata).
  Either `docker volume` if you want to use the default docker volume location, or `host directory` if you want to define specific location on your filesystem (usefull when extending storage).

- **Chaindata**:
  The name of the docker volume that will be used or the path to the directory to mount, depending on your answer to the last question.

- **Expose RPC**:
  If you want to expose or not port `8545`.
  It is the RPC api to your node.
  It should be only exposed if you have a specific reason to access the TomoChain JSON-RPC Protocol.
  The masternode owner is responsible of proxing and securing the RPC api as it should not be directly exposed to the internet.

- **Expose WebSocket**:
  If you want to expose or not port `8546`.
  It is the WebSocket api to your node.
  It should only be exposed if you have a specific reason to access the TomoChain Protocol via WebSocket.
  The masternode owner is responsible of proxing and securing the WebSocket api as it should not be directly exposed to the internet.

- **Logging level**:
  Set the logging level of the TomoChain container to error, info or debug.
  Info or Error is usually a good logging level.
  Only use the debug level if you have a good reason to do so, it will generate a lot of output and increase ressource usage.


Once finished, you will get a folder named after your masternode (in our case "mymasternode") with two files.

- `.env`
  Which contains the configuration generated from your answers to the question.

- `docker-compose.yml`
  Which tells docker-compose how and which container run for your node.
  Your specific configuration will be read from the `.env` file.

Now that we have generated the correct initial configuration for docker-compose, we just need to start our node.

```bash
docker-compose up -d
```

You can check that your masternode is running with the `ps` sub-command.

```bash
docker-compose ps
```

For more docker-compose commands, use `docker-compose --help` or refer to their [documentation](https://docs.docker.com/compose/reference/overview/).

## `tmn` equivalence

For the long time masternode runners who started with our older tool, `tmn`, here are the commands to achieve the same actions.

**tmn start**:
```
docker-compose up -d
```

**tmn stop**:
```
docker-compose stop
```

**tmn update**:
```
docker-compose pull
docker-compose up -d
```

**tmn remove**:
```
docker-compose down
```

## Troubleshooting

### error: could not access the docker daemon

If you have installed Docker, you probably forgot to add your user to the docker group.
Please run this, close your session and open it again.

```
usermod -aG docker $your_user_name
```
