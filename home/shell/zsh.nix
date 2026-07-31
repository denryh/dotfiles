{ ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;

    shellAliases = {
      hm = "nix run ~/dotfiles#homeConfigurations.henry.activationPackage";
      ls = "eza";
      ll = "eza -la";
      lt = "eza --tree";
      cat = "bat";
    };

    sessionVariables = {
      PAGER = "bat";
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    };
  };
}
