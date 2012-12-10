# dotfiles - [github:michaelkitson/dotfiles](git://github.com/michaelkitson/dotfiles.git "git://github.com/michaelkitson/dotfiles.git")
---
### my dotfiles, including:
* [the **king** of dotfiles install/update scripts](https://github.com/michaelkitson/dotfiles/blob/master/bin/dotfiles.sh "https://github.com/michaelkitson/dotfiles/blob/master/bin/dotfiles.sh")
  * [raw:dotfiles.sh](https://raw.github.com/michaelkitson/dotfiles/master/bin/dotfiles.sh "https://raw.github.com/michaelkitson/dotfiles/master/bin/dotfiles.sh") auto install/update script
  * **THIS COMMAND WON'T PROMPT YOU BEFORE MODIFYING DOTFILES IN $HOME**
  
  ```shell
  curl https://raw.github.com/michaelkitson/dotfiles/master/bin/dotfiles.sh | bash
  ```
  
  * but this would:
  
  ```shell
  curl https://raw.github.com/michaelkitson/dotfiles/master/bin/dotfiles.sh > /tmp/dotfiles.sh
  chmod +x /tmp/dotfiles.sh
  /tmp/dotfiles.sh
  ```
    
  * tested on Debian stable/squeeze, Raspbian, and OS X 10.8.2
