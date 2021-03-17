#!/bin/sh

link() {
  echo "This utility will copy the files in $HOME/.config directory to this repo"
  echo "Do you want work or home directories?"

  read directory

  if [ "$directory" = 'home' -o "$directory" = 'work' ] ; then

    echo "Proceed with ${directory}? (y/n)"
    read resp

    if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
      echo "Executing: mkdir '$HOME/.old_repo_dotfile'"
      mkdir "$HOME/.old_repo_dotfile"

      echo "Executing: rm -rf '$HOME/.old_repo_dotfile/$directory'"
      rm -rf "$HOME/.old_repo_dotfile/$directory"

      echo "Executing: mkdir '$HOME/.old_repo_dotfile/$directory'"
      mkdir "$HOME/.old_repo_dotfile/$directory"

      echo "Executing: cp -r '$HOME/.old_repo_dotfile/$directory'"
      cp -r  "$PWD/$directory" "$HOME/.old_repo_dotfile/$directory"

      echo "Executing: rm -rf '$PWD/$directory'"
      rm -rf "$PWD/$directory"

      echo "Executing: mkdir '$PWD/$directory'"
      mkdir "$PWD/$directory"

      for file in $( ls -A $HOME/.config | grep -vE '.*exclude.*|\.git|\.gitignore|.*.md') ; do
        echo "Executing: cp -r "$HOME/.config/$file" '$PWD/$directory/$file'"
        cp -r "$HOME/.config/$file" "$PWD/$directory/$file"
      done

      echo "Copying complete"
    else

      echo "Copying cancelled by user"
      return 1

    fi
  else

    echo "Wrong input"
    return 1

  fi
}

link
