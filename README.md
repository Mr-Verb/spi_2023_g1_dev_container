# SPI 2023 Group 1 Dev Container - Zettlr
## Step 0 - Before Getting Started
Before getting started, you are going to need the following downloaded onto your computer:
- Docker: https://www.docker.com/
  - Docker for Desktop is good for visualising your images and containers
- VS Code: https://code.visualstudio.com/
  - VS Code will be used to remotely connect to the container
  - The 'Dev Containers' extension is required
- If running Windows - Git for Windows: https://gitforwindows.org/
  - Needed to run Git Bash in VS Code terminal
- Optional
  - GitHub for Desktop: https://desktop.github.com/
    - Makes cloning a forked repository easy

## Step 1 - Getting Started
To properly run the Dev Container, the Zettlr Open Source Project must be forked to your GitHub and cloned into a directory on your computer:
- Go to https://github.com/Zettlr/Zettlr and fork the project
- Create a folder of your choice on your computer to download the Zettlr project. For this guide the folder will be called "SPI_2023"
- Inside the "SPI_2023" folder, clone the fork of Zettlr from your GitHub repo

## Step 2 - Running the Script
Next the script in this repo will be run that will create the container. It does this by checking the type of Operating System your computer runs
and binds the Zettlr folder inside the "SPI_2023" folder to the "/home/Zettlr" folder in the container. This will allow you to make changes in the
container and have it reflected on your computer:
- Download the container_builder.sh script and put it in the "SPI_2023" folder
- Open the "SPI_2023" folder in VS Code
- Open a new terminal
  - If on Windows, make sure you open a bash terminal
  - If on Linux or Mac, the standard terminal is good
- Run "chmod +x container_builder.sh" in the terminal. This will allow the script to execute
- Run "./container_builder.sh" to run the script
  - This will prompt you to ensure Zettlr has been forked and the Zettlr folder is in the current directory
  - The script detects the OS type and prints it to the terminal
  - It then prints the current working directory
  - Docker will download the required image from dockerhub
  - Docker will then create and run a container called SPI_G1_Dev_Container using the downloaded image
  - The Dev Container is now running! It will download the required dependencies into the cache. Depending on internet connection, RAM and CPU power
  it will take between 5 and 15 minutes. To check the progress of this installation, in Dockerhub in the containers tab, click on the SPI_G1_Dev_Container container.
  This should show the logs which will print the progress to the output.
  
## Step 3 - Connect to the Container
Finally, to start developing, you need to connect to the container:
- In VS Code, click the green box at the bottom left of the screen
- Select "Attach to Running Container"
- Select the "SPI_G1_Dev_Container"
- A new window will open which will connect to the container
- To open the home folder:
  - ->File 
  - ->Open Folder
  - in the textbox write "/home/"
- Finally open a new terminal to start developing! 

## Step 4 - Developing
Read the https://github.com/Zettlr/Zettlr README to get more information about how to develop for Zettlr


  
  
  
