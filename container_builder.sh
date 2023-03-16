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

docker build -t spi_2023_g1_dev_container_image:1.1.13 .
docker run -d -it --name dev_container --mount type=bind,source="$NEEDED_PATH",target=/home/Zettlr spi_2023_g1_dev_container_image:1.1.13
echo "Now click the the green connection button in the bottom right corner and select 'attach to running container'"