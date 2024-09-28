CONDA_ENV = slides-2021
SHELL=bash

CONDA = $(shell which conda)
ifeq ($(CONDA),)
	CONDA=${HOME}/miniconda3/bin/conda
endif

default: help

clean: ## cleanup the project
	@rm -rf _site
	@rm -rf .sass-cache
	@rm -rf .bundle
	@rm -rf vendor
.PHONY: clean

create-env: ## create conda environment
	if ${CONDA} env list | grep '^${CONDA_ENV}'; then \
	    ${CONDA} env update -f environment.yml; \
	else \
	    ${CONDA} env create -f environment.yml; \
	fi
.PHONY: create-env

ACTIVATE_ENV = source $(dir ${CONDA})activate ${CONDA_ENV}
COND_ENV_DIR=$(shell dirname $(dir $(CONDA)))
install: clean ## install dependencies
	$(ACTIVATE_ENV) && \
		gem update --no-document --system && \
		gem install bundler && \
		pushd ${COND_ENV_DIR}/envs/${CONDA_ENV}/share/rubygems/bin && \
		ln -sf ../../../bin/ruby ruby && \
		popd && \
		bundle install && \
.PHONY: install

serve: ## run a local server
	$(ACTIVATE_ENV) && \
		bundle exec jekyll serve
.PHONY: serve

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help