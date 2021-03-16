#!/bin/sh

link() {
  echo "This utility will symlink the files in $HOME/.config directory to this repo"
  echo "Do you want work or home directories?"

  read directory

  if [ "$directory" = 'home' -o "$directory" = 'work' ] ; then

    echo "Proceed with ${directory}? (y/n)"
    read resp

    if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
      rm -rf "$PWD/.old_dotfile_repo/$directory"
      mkdir "$PWD/.old_dotfiles_repo/"
      mkdir "$PWD/.old_dotfiles_repo/$directory"

      for file in $( ls -A $PWD/$directory | grep -vE '.*exclude.*|\.git|\.gitignore|.*.md') ; do
        mv "$PWD/$directory/$file" "$PWD/.old_dotfiles_repo/$directory"
      done

      for file in $( ls -A $HOME/.config | grep -vE '.*exclude.*|\.git|\.gitignore|.*.md' ) ; do
        ln -fsv "$HOME/.config" "$PWD/$directory/$file"
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
