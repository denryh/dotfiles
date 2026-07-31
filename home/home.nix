{ ... }:

{
  imports = [
    # Core
    ./packages.nix
    ./fonts.nix

    # Shell
    ./shell/zsh.nix

    # CLI
    ./cli/git.nix
    ./cli/fzf.nix
    # ./cli/zoxide.nix
    # ./cli/direnv.nix
    # ./cli/starship.nix
    # ./cli/ssh.nix

    # Terminal
    ./terminal/wezterm.nix

    # Editors
    # ./editors/neovim.nix

    # Development
    # ./development/node.nix

    # Platform-specific
    # ./platforms/linux.nix
    # ./platforms/darwin.nix
  ];

  home = {
    # Don't change this after the initial setup unless you know why.
    stateVersion = "26.11";
  };

  programs.home-manager.enable = true;
}
