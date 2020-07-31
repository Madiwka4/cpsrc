echo "Your preferred text editor (type in package that will be used, as per your package manager:"
read editor 

echo "Set your editor as $editor" 
read -r -p "${1:-Is your editor's package name different from its binary name (e.g. python-pip and pip)? [y/N]} " response
case "$response" in
    [yY][eE][sS]|[yY]) 
    echo "Enter your editor's package name"
    read editorPACKAGE
    echo "set editor PACKAGE as $editorPACKAGE"
        ;;
    *)  
        editorPACKAGE=$editor 
        echo "Setting editor PACKAGE as $editorPACKAGE"
        
        ;;
esac
echo "Your distro? ( 1)Arch, 2)Debian): "
read distro
if [ $distro -eq 1 ]
then 
    sudo pacman -Syu g++ $editorPACKAGE  
elif [ $distro -eq 2 ]
then
    sudo apt update
    sudo apt upgrade 
    sudo apt install g++ $editorPACKAGE
	
else 
    echo "Please install/update these packages manually: $editorPACKAGE, G++"
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
            DIR='.'
            echo "Setting this directory ($DIR)"
            ;;
    esac

# create.sh
echo 'cp template.cpp $1.cpp \n' > $DIR/create.sh
printf "$editor " >> $DIR/create.sh
printf '$1.cpp ' >> $DIR/create.sh  


# template
read -p "Press enter to create template" A
$editor $DIR/template.cpp

# run.sh
echo 'g++ -o $1.out -g $1.cpp\n./$1.out' > $DIR/run.sh

# make all executable
chmod +x $DIR/create.sh
chmod +x $DIR/run.sh
