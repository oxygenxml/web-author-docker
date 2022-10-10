#!/bin/bash

build_example () {
	EXAMPLE=$1
	BUILD_ARGS=""
	if [[ ! -z $https_proxy ]]
	then
		BUILD_ARGS="${BUILD_ARGS} --build-arg https_proxy=$https_proxy"
	fi	
	if [[ ! -z $http_proxy ]]
	then
		BUILD_ARGS="${BUILD_ARGS} --build-arg http_proxy=$http_proxy"
	fi	
	docker build $EXAMPLE -t web-author-$EXAMPLE $BUILD_ARGS
}	

set -x
build_example base
build_example license-server-config-env-var

