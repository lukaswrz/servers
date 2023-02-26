{ pkgs, ... }: {
  imports =
    [
      ./bottom.nix
      ./git.nix
      ./helix.nix
      ./ssh.nix
      ./zellij.nix
      ./bash.nix
      ./readline.nix
      ./nix-index.nix
    ];

  home.packages = with pkgs; [ ncdu curl ];
}
