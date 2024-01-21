
# publish push
pub: build
	find ./docs/* ! -name "CNAME" |xargs rm -rf
	cp -r ./dist/*  ./docs/

build: pre-build
	loppo

pre-build:
	rm -rf dist chapters.yml

server: pre-build
	loppo server

