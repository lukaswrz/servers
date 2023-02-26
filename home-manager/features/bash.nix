{ pkgs, ... }: {
  programs.bash = {
    enable = true;

    initExtra = ''PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ' '';
    enableCompletion = true;
    shellAliases = {
      ls = "ls --classify=auto --color=auto --hyperlink=auto";
      ll = "ls --all -l";
      grep = "grep --color=auto";
      egrep = "grep --extended-regexp --color=auto";
      fgrep = "grep --fixed-strings --color=auto";
      diff = "diff --color=auto";
      rm = "rm --interactive=once --preserve-root";
      mv = "mv --interactive";
      cp = "cp --interactive";
      ln = "ln --interactive";
      chown = "chown --preserve-root";
      chmod = "chmod --preserve-root";
      chgrp = "chgrp --preserve-root";
    };
    shellOptions = [
      "autocd"
      "nullglob"
      "extglob"
      "globstar"
    ];
  };
}
