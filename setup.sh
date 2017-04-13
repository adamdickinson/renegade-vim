# Prep
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
G="\e[32m"
R="\e[31m"
RESET="\e[0m"



# Banner
clear
echo "Renegade Vim / Config Auto-Setup"
echo "---"
echo



# 1. Copy vimrc
echo -e " : Loading vimrc\c"
if [ -f $DIR/.vimrc ]; then

  read -p " | Config file .vimrc already exists - overwrite? (y/n) " -n 1 -r
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "\r$R ✕ Loading vimrc failed                                                        $RESET"
    exit 1
  else
    echo -e "\r$G ✓ Loaded vimrc (overwritten)                                                  $RESET"
    cp $DIR/.vimrc ~/.vimrc 
  fi

else
  echo -e "\r$G ✓ Loaded vimrc                                                             $RESET"
  cp $DIR/.vimrc ~/.vimrc
fi



# 2. Install vim-plug 
echo -e " : Loading vim-plug\c"
if [ -f ~/.vim/autoload/plug.vim ]; then
  echo -e "\r$G ✓ Loaded vim-plug (already exists)                                                  $RESET"
else
  if curl -sSfLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 2>&1 > /dev/null; then
    echo -e "\r$G ✓ Loaded vim-plug                                                  $RESET"
  else
    echo -e "\r$R ✕ Loading vim-plug failed                                                        $RESET"
    exit 1
  fi
fi



# 3. Install plugins
echo -e " : Installing plugins\c"
vim +PlugClean! +PlugInstall +qall
echo -e "\r$G ✓ Plugins installed      $RESET"


echo
echo "All done!"