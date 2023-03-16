#!/bin/bash
git --version
echo "Before going further ensure you fork the Zettlr Repo into your GitHub"
echo -n "Enter GitHub Username: "
read USERNAME
NEEDED_PATH=""

case $OSTYPE in
    msys*)
        echo "MSYS dectected!"
        NEEDED_PATH=/$PWD
        git clone https://github.com/$USERNAME/Zettlr.git
        echo $NEEDED_PATH
        ;;
    darwin*)
        echo OSX
        ;;
    linux*)
        echo linux
        ;;
esac

docker build -t spi_2023_g1_dev_container_image:1.1.11 .
docker run --name dev_container -v $NEEDED_PATH/Zettlr:/home/Zettlr -d spi_2023_g1_dev_container_image:1.1.11
echo "Now click the the green connection button in the bottom right corner and select 'attach to running container'"