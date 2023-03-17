#!/bin/bash
git --version
echo "Before going further ensure you fork the Zettlr Repo into your GitHub and it has been cloned into the current directory. Press any key to continue:"
#echo -n "Enter GitHub Username: "
read USERNAME
NEEDED_PATH=""

case $OSTYPE in
    msys*)
        echo "MSYS dectected!"
        NEEDED_PATH=/$PWD/Zettlr
        #git clone https://github.com/$USERNAME/Zettlr.git
        echo $NEEDED_PATH
        ;;
    darwin*)
        echo OSX
        NEEDED_PATH=$PWD/Zettlr
        echo $NEEDED_PATH
        ;;
    linux*)
        echo linux
        NEEDED_PATH=$PWD/Zettlr
        echo $NEEDED_PATH
        ;;
esac

docker build -t spi_2023_g1_dev_container_image:1.2.0 .
docker run -d -it --name SPI_G1_Dev_Container --mount type=bind,source="$NEEDED_PATH",target=/home/Zettlr spi_2023_g1_dev_container_image:1.2.0
echo "Now click the the green connection button in the bottom right corner and select 'attach to running container'"
echo -n "Once conntected navigate to /home/Zettlr and 'yarn install --frozen-lockfile'"
