{ config, pkgs, ... }:

{
  # imports = builtins.map (file: ./modules/${file}) [ "helix.nix" ];
  home.username = "ikanasync";
  home.homeDirectory = "/home/ikanasync";
  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.05"; # Please read the comment before changing.
  news.display = "silent";

  home.packages = with pkgs; [
    # neovim
    vlc
    eza
    zoxide
    go
    nodejs_24
    strawberry
    stow
    tmux
    nixd # lsp nix
    nixfmt # nix formatter
    lolcat
    gh
    kooha
    zig
  ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.sessionPath = [ ];

  programs.git = {
    settings = {
      user.name = "IkanAsync";
      user.email = "fahrialimuddin653@gmail.com";
      core.editor = "nvim";
    };

  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  programs.home-manager.enable = true;
}
