{ inputs, pkgs, ... }: {
  imports = [
    ../global

    ../features
  ];

  home.username = "lukas";
}
