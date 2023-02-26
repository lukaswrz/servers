{ pkgs, ... }: {
  programs.git = {
    enable = true;
    delta = {
      enable = true;
      options = {
        decorations = {
          commit-decoration-style = "bold yellow box ul";
          file-decoration-style = "brightyellow ul ol";
          file-style = "bold yellow ul";
          hunk-header-decoration-style = "purple box";
          hunk-header-style = "file line-number syntax";
        };
        features = "line-numbers decorations";
        whitespace-error-style = "22 reverse";
      };
    };
    package = pkgs.gitAndTools.gitFull;
    extraConfig = {
      feature.manyFiles = true;
      init.defaultBranch = "main";
      color.ui = true;
    };
    lfs = { enable = true; };
  };
}
