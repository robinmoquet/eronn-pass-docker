user := $(shell id -u)

.PHONY: clone
clone: 
	sudo git clone https://github.com/robinmoquet/eronn-pass-api.git
	sudo chown -R $(user) eronn-pass-api
	sudo git clone https://github.com/robinmoquet/eronn-pass-mailer.git
	sudo chown -R $(user) eronn-pass-mailer

.PHONY: install
install: 
	cd eronn-pass-api && npm install && cd ..
	cd eronn-pass-mailer && npm install && cd ..

.PHONY: build
build: 
	cd eronn-pass-api && npm run build && cd ..
	cd eronn-pass-mailer && npm run build && cd ..

.PHONY: pull
pull: 
	cd eronn-pass-api && git pull && cd ..
	cd eronn-pass-mailer && git pull && cd ..

.PHONY: dev
dev: 
	docker-compose up