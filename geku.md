Compiled with a lot of help from here: https://notes.ethereum.org/@launchpad/kiln

# Environment

This guide has been tested and is working on (though it should work on almost any docker host):

- Debian
- `amd64` and `arm64`

Please submit a PR if you are able to get it working in other environments.

# Install pre-requisites:

* Linux/Unix
* Make (Makefile)
* Docker & Docker-Compose


# Make deposits

## Generate keys

This script will generate the:
- Password
- Mneominc
- Keystores
- Password `.txt` file(s) (corresponding to each `.json` file)
- Token (`jwtsecret`)

```
sudo make prep
```

Please save and backup the created **PASSWORD**, **MNEMONIC** and **KEYSTORES** before proceeding 


## Deposit

### Get testnet ETH

- Connect your MetaMask to Kiln (see https://kiln.themerge.dev/ for more details)
- Get >32 ETH from https://faucet.kiln.themerge.dev/

### Make deposit

Go to https://kiln.launchpad.ethereum.org/en/ and click "Become a Validator" - then follow the process.



# Build clients

The first execution of the run script will build the necessary docker containers (see **Run**).

# Run

This command will build the docker containers
* GETH (Execution Layer)
* TEKU (Consensus Layer)


```
sudo make run
```
