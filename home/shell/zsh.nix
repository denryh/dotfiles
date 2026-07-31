{ ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    fastSyntaxHighlighting.enable = true;

    shellAliases = {
      hm = "nix run ~/dotfiles#homeConfigurations.henry.activationPackage";
      ls = "eza";
      ll = "eza -la";
      lt = "eza --tree";
      cat = "bat";
      lg = "lazygit";
    };

    sessionVariables = {
      PAGER = "bat";
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    };
  };
}
