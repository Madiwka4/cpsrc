echo "Your distro? ( 1)Arch, 2)Debian): "
read distro
if [ $distro -eq 1 ]
then 
    sudo pacman -Syu g++ code
elif [ $distro -eq 2 ]
then
    sudo apt update
    sudo apt upgrade 
    sudo apt install g++ code
	
else 
    echo "Please install these packages manually: Code, G++"
    read -p "Press enter to continue" A	
fi

    read -r -p "${1:-Set custom directory for code? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY]) 
	    echo "Enter directory for files:"
            read DIR
		echo "set dir as $DIR"
            ;;
        *)
            echo "Setting this directory"
            ;;
    esac

# create.sh
echo 'cp template.cpp $1.cpp \n code $1.cpp' > $DIR/create.sh

# template
read -p "Press enter to create template" A
code $DIR/template.cpp

# run.sh
echo 'g++ -o $1.out -g $1.cpp\n./$1.out' > $DIR/run.sh

# make all executable
chmod +x $DIR/create.sh
chmod +x $DIR/run.sh
