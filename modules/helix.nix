{ config, pkgs, ... }:
{
  programs.helix = {
    enable = true;

    settings = {
      theme = "nord";
      editor = {
        line-number = "relative";
        mouse = false;
        auto-info = false;
      };

      editor.lsp = {
        display-messages = true;
        display-inlay-hints = true;
        display-signature-help-docs = false;

      };

      editor.whitespace = {
        space = "all";
        tab = "all";
        nbsp = "none";
        nnbsp = "none";
        newline = "none";
      };
      editor.whitespace.characters = {
        space = "·";
        nbsp = "⍽";
        nnbsp = "␣";
        tab = "→";
        newline = "⏎";
        tabpad = "·";
      };

      keys.insert = {
        "j"."k" = "normal_mode";
      };
      keys.normal = {
        esc = [
          "collapse_selection"
          "keep_primary_selection"
        ];
      };

    };
    languages = {
      language = [
        {

          name = "nix";
          auto-format = true;
          language-servers = [ "nixd" ];
          formatter.command = "nixfmt";
        }
        {
          name="rust";
          auto-format=true;
          
        }

      ];
    };

  };

}
