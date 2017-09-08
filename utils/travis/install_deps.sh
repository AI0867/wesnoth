#!/bin/bash

set -ev

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then

	brew update
	brew install scons cairo pango moreutils sdl2_image sdl2_ttf sdl2_mixer openssl

else

	#if [ "$CXXSTD" == "1y" ]; then
	#	sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y;
	#fi
	sudo apt-get update -qq
	sudo apt-get install -qq libboost-filesystem-dev libboost-iostreams-dev libboost-random-dev libboost-program-options-dev libboost-regex-dev libboost-system-dev libboost-test-dev libboost-locale-dev libboost-thread-dev
echo 'foo1'
	sudo apt-get install -qq libcairo2-dev libfribidi-dev libpango1.0-dev
echo 'foo2'
	#sudo apt-get install -qq libsdl2-image-dev
echo 'foo3'
	sudo apt-get install -qq libsdl2-mixer-dev
echo 'foo4'
	sudo apt-get install -qq libsdl2-ttf-dev
echo 'foo5'
	sudo apt-get install -qq libvorbis-dev
echo 'foo6'
	sudo apt-get install gdb moreutils xvfb libssl-dev

	if [ "$USE_CMAKE" = true  ]; then
		sudo apt-get install -qq cmake;
	else
		sudo apt-get install -qq scons;
	fi

	if [ "$CXXSTD" == "1y" ]; then
		sudo apt-get install -qq g++-5;
		export CXX=g++-5;
		export CC=gcc-5;
	fi

fi
