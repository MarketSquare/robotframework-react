SHELL := /bin/bash
CURRENT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: .py27 .py36 test

clean:
	@echo "Clean"
	rm -rf .py27
	rm -rf .py36

.py27:
	@echo "Build Python 2"
	virtualenv .py27
	.py27/bin/pip install -r requirements.txt
	.py27/bin/python setup.py develop
	(cd tests/create-react-app && yarn install)
	(cd tests/create-react-app-with-redux && yarn install)

.py36:
	@echo "Build Python 3"
	virtualenv .py36 -p python3.6
	.py36/bin/pip install -r requirements.txt
	.py36/bin/python setup.py develop
	(cd tests/create-react-app && yarn install)
	(cd tests/create-react-app-with-redux && yarn install)

build-docs:
	@echo "Build Keyword Documentation"
	.py27/bin/python -m robot.libdoc ReactLibrary docs/index.html

test:
	make test-27
	make test-36

test-27:
	@echo "Run Tests on Python 2.7"
	.py27/bin/pybot tests

test-36:
	@echo "Run Tests on Python 3.6"
	.py36/bin/pybot tests

release:
	.py27/bin/fullrelease
