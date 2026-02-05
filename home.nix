{ pkgs, ... }:

{
  # Set your username and home
  home.username = "c0mrade007";
  home.homeDirectory = "/home/c0mrade007";

  # Shell
  programs.bash.enable = true;

  # Link your .bashrc from repo
  home.file = {
    ".bashrc".source = ./bashrc;
  };

  # Neovim
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
      source ${./nvim/init.vim}
    '';
  };

  # Optional packages
  home.packages = [
    pkgs.fastfetch
    pkgs.tmux
  ];
}

