DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
G="\e[32m"
R="\e[31m"
RESET="\e[0m"


function diffAndMove {
  colordiff -u $DIR/$1 ~/$1
  echo "Diff for '$1'"
  read -p " | Copy changes across? (y/n) " -n 1 -r
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "\r$R ✕ Skipping '$1'            $RESET"
  else
    echo -e "\r$G ✓ Copied '$1'              $RESET"
    cp ~/$1 $DIR/$1
  fi
  echo
}

clear


diffAndMove .vimrc
diffAndMove .tmux/renegade
diffAndMove .tmux.conf

for d in ~/.vim/renegade-snippets/*; do
  diffAndMove ${d/#$HOME\//}
done

