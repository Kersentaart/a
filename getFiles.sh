#!/bin/sh

link() {
  echo "This utility will symlink the files in this repo to $HOME/.config directory"
  echo "Do you want work or home directories?"

  read directory

  if [ "$directory" = 'home' -o "$directory" = 'work' ] ; then

    echo "Proceed with ${directory}? (y/n)"
    read resp

    if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then

      rm -rf "$HOME/.old_dotfiles"
      mkdir "$HOME/.old_dotfiles"
      for file in $( ls -A $HOME/.config | grep -vE '.*exclude.*|\.git|\.gitignore|.*.md') ; do
        mv "$HOME/.config/$file" "$PWD/.old_dotfiles/$file"
      done

      for file in $( ls -A | grep -vE '.*exclude.*|\.git|\.gitignore|.*.md' ) ; do
        cp -r "$PWD/$directory/$file" "$HOME/.config/$file"
      done

      echo "Symlinking complete"
    else
      echo "Symlinking cancelled by user"
      return 1
    fi
  else
    echo "Wrong input"
    return 1
  fi
}

link
