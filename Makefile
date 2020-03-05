user := $(shell id -u)

.PHONY: clone
clone: 
	sudo git clone https://github.com/robinmoquet/eronn-pass-api.git
	sudo chown -R $(user) eronn-pass-api
	sudo git clone https://github.com/robinmoquet/eronn-pass-mailer.git
	sudo chown -R $(user) eronn-pass-mailer

.PHONY: install
install: 
	cd eronn-pass-api && npm install
	cd eronn-pass-mailer && npm install

.PHONY: build
build: 
	cd eronn-pass-api && npm run build
	cd eronn-pass-mailer && npm run build

.PHONY: pull
pull: 
	cd eronn-pass-api && git pull
	cd eronn-pass-mailer && git pull

.PHONY: dev
dev: 
	docker-compose up

.PHONY: cert
cert: 
	cd eronn-pass-api && mkdir cert
	cd eronn-pass-api/cert && ssh-keygen -t rsa -b 4096 -m PEM -f jwtRS256.key
	cd eronn-pass-api/cert && openssl rsa -in jwtRS256.key -pubout -outform PEM -out jwtRS256.key.pub