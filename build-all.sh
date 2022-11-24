#!/bin/bash

build_example () {
	EXAMPLE_NAME=$1
	BUILD_ARGS=""
	if [[ ! -z $https_proxy ]]
	then
		BUILD_ARGS="${BUILD_ARGS} --build-arg https_proxy=$https_proxy"
	fi	
	if [[ ! -z $http_proxy ]]
	then
		BUILD_ARGS="${BUILD_ARGS} --build-arg http_proxy=$http_proxy"
	fi	
	docker build $EXAMPLE_NAME --no-cache -t web-author-$EXAMPLE_NAME $BUILD_ARGS
}	

set -x
build_example base
build_example license-server-config-env-var
build_example auto-update-framework
