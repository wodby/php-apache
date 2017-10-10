-include env_make

APACHE_VER ?= 2.4
TAG ?= $(APACHE_VER)

FROM_TAG = $(APACHE_VER)
REPO = wodby/php-apache
NAME = php-apache-$(APACHE_VER)

ifneq ($(FROM_STABILITY_TAG),)
    FROM_TAG := $(FROM_TAG)-$(FROM_STABILITY_TAG)
endif

.PHONY: build test push shell run start stop logs clean release

default: build

build:
	docker build -t $(REPO):$(TAG) --build-arg FROM_TAG=$(FROM_TAG) ./

test:
	IMAGE=$(REPO):$(TAG) ./test.sh

push:
	docker push $(REPO):$(TAG)

shell:
	docker run --rm --name $(NAME) -i -t $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) /bin/bash

run:
	docker run --rm --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG)

start:
	docker run -d --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG)

stop:
	docker stop $(NAME)

logs:
	docker logs $(NAME)

clean:
	-docker rm -f $(NAME)

release: build push
