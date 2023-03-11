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
    hostName = "abacus";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 ];
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

  security.acme = {
    defaults.email = "lukas@wrz.one";
    acceptTerms = true;
  };

  services = {
    vaultwarden = {
      enable = true;

      config = {
        SIGNUPS_ALLOWED = false;

        ROCKET_ADDRESS = "127.0.0.1";
        ROCKET_PORT = 8000;
      };
    };

    nginx = {
      enable = true;

      recommendedGzipSettings = true;
      # recommendedBrotliSettings = true;
      recommendedTlsSettings = true;
      recommendedOptimisation = true;

      virtualHosts = {
        # "wrz.one" = {
        #   enableACME = true;
        #   forceSSL = true;
        #   locations."/" = {
        #     root = "/srv/http/wrz.one";
        #   };
        # };
        "defenestrated.systems" = {
          enableACME = true;
          forceSSL = true;
          locations."/" = {
            root = "/srv/http/defenestrated.systems";
          };
        };
        "vault.defenestrated.systems" = {
          enableACME = true;
          forceSSL = true;
          locations."/" = {
            recommendedProxySettings = true;
            proxyPass = "http://127.0.0.1:8000";
          };
        };
        "share.defenestrated.systems" = {
          enableACME = true;
          forceSSL = true;
          locations."/" = {
            recommendedProxySettings = true;
            proxyPass = "http://127.0.0.1:8010";
          };
        };
        "static.defenestrated.systems" = {
          enableACME = true;
          forceSSL = true;
          locations."/" = {
            root = "/srv/http/static.defenestrated.systems";
          };
        };
      };
    };
  };
}
