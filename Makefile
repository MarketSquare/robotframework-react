SHELL := /bin/bash
CURRENT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: clean .py27 test

clean:
	@echo "Clean"
	rm -rf .py27

.py27:
	@echo "Build"
	virtualenv .py27
	.py27/bin/pip install -r requirements.txt
	.py27/bin/python setup.py develop
	(cd tests/create-react-app && yarn install)
	(cd tests/create-react-app-with-redux && yarn install)

build-docs:
	@echo "Build Keyword Documentation"
	.py27/bin/python -m robot.libdoc ReactLibrary docs/index.html

test:
	@echo "Run Tests"
	.py27/bin/pybot tests
