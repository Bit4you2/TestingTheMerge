FROM debian:testing-slim as kiln-keygen
#ENV TZ=Europe/Brussels
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update -y; apt-get upgrade -y
#RUN apt-get install -y software-properties-common
RUN apt-get install -y wget
RUN wget https://github.com/ethereum/eth2.0-deposit-cli/releases/download/v2.0.0/staking_deposit-cli-e2a7c94-linux-amd64.tar.gz && tar -xzf staking_deposit-cli-e2a7c94-linux-amd64.tar.gz
RUN mv staking_deposit-cli-e2a7c94-linux-amd64/ build
CMD cd build && ./deposit new-mnemonic --num_validators=1 --mnemonic_language=english --chain=kiln
