#!/usr/bin/make -f

.PHONY: all
all: build

build: Dockerfile
	docker build -t neo4j-apoc:3.5 .
