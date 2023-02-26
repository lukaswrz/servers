{ pkgs, ... }: {
  boot = {
    loader.grub = {
      enable = true;
      version = 2;
      device = "/dev/sda";
    };
    kernelParams = [ ];
  };

  time.timeZone = "UTC";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";

  networking = {
    hostName = "haze";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
      allowedUDPPorts = [ ];
    };
  };

  users.users = {
    lukas = {
      initialPassword = "lukas";
      shell = pkgs.bash;
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add more keys
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK4U9RzV/gVGBfrCOye7BlS11g5BS7SmuZ36n2ZIJyAX lukas@glacier"
      ];
      extraGroups = [ "wheel" ];
    };
  };
}
