# Overview

This is a fork of RinRi's <a href="https://github.com/RinRi-D/cpsrc">cpsrc</a>, but made to be compatible with Debian based Operating Systems, and use Visual Studio Code instead of neovim.

It also has a couple tweaks, such as custom directories, better dpendency compatibility, and custom program names.

# Installation

Clone the repository and make setup.sh executable and run it:

```shell
git clone https://github.com/Madiwka4/cpsrc.git
cd cpsrc
chmod +x setup.sh
./setup.sh
```
First, you have to choose your default text editor. You can set any editor you want, as long as it supports opening files using the "editor file" type shell command. 
Then, you can choose the package name of the editor. This makes sure that the editor is up to date. 
After that, you are given the choise to enter your custom directory, for example, 

```
Enter custom directory for code? [y/N] y
Enter directory for files:
/home/user/Code
Set directory as /home/user/Code

```
and your files will be unpacked in /home/user/Code!

Next, you can create your own template. This doesnt support pre-selected lines, since it doesn't work on VIM!

# Usage

In order to create a new .cpp file, you have to run create.sh with filename argument without an extension:

```shell
./create.sh 1234a
```

You will be automatically redirected to VSCode.

To compile&run file, you can just use run.sh with filename, (also without extension)

```shell
./run.sh 1234a
```
