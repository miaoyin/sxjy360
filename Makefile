
# publish push
pub: build
	find ./docs/* ! -name "CNAME" ! -name "404.html" |xargs rm -rf
	cp -r ./dist/*  ./docs/

build: pre-build
	loppo


server: pre-build
	loppo server

pre-build:
	rm -rf dist chapters.yml

#---------------------------------------------
#  Install development environment
#---------------------------------------------
install-dev:
	- mkdir $(HOME)/software
ifneq ($(HOME)/software/node-v20.11.0-linux-x64,)
	wget https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-x64.tar.xz -P $(HOME)/software
	tar -xvf $(HOME)/software/node-v20.11.0-linux-x64.tar.xz -C ~/software
	echo "export PATH=\$$PATH:$(HOME)/software/node-v20.11.0-linux-x64/bin" >> $(HOME)/.bashrc
	npm config set registry https://registry.npmmirror.com
	npm update
endif
	npm install loppo -g
	