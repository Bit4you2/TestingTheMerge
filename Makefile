DOCKER_IMAGE="keygen"
PASSWORD := $(shell date +%s | sha256sum | base64 | head -c 8 ; echo)

help:
	@echo "clean - remove build and Python file artifacts"
	@echo "prep  - prepare keygen and jwtsecret (only execute the keygen part once)"

clean:
	rm -rf validator_keys/
	rm -rf volumes/

prep:
	mkdir -p ./volumes/jwt
	rm -rf validator_keys/
	@docker build --pull -t $(DOCKER_IMAGE) keygen/.
	@echo "*******************************"
	@echo "*** Password: [$(PASSWORD)] ***"
	@echo "*******************************"
	@docker run -it --rm -v $(CURDIR)/validator_keys:/build/validator_keys  $(DOCKER_IMAGE)
	./scripts/password.sh $(PASSWORD)
	@openssl rand -hex 32 | tr -d "\n" > "./volumes/jwt/jwtsecret"

run:
	docker-compose up --build -d
