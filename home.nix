{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ikanasync";
  home.homeDirectory = "/home/ikanasync";
  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [ neovim vlc eza helix zoxide ];
  home.file = { };

  home.sessionVariables = { EDITOR = "neovim"; };

  programs.fish = {
    enable = true;

    shellAliases = {
      hll = "echo 'hello world'";

    };
  };
  programs.git = {
    enable = true;
    userName = "IkanAsync";
    userEmail = "fahrialimuddin653@gmail.com";

    delta.enable = true;

    extraConfig = {
      init.defaultBrach = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      core.editro = "nvim";

    };

  };

  programs.home-manager.enable = true;
}
