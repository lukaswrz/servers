{
  imports = [
    ../global

    ../features

    ./configuration.nix
    ./hardware-configuration.nix
  ];

  system.stateVersion = "22.11";
}
