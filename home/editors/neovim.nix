{ pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;

    # Load the generated config via a wrapper argument instead of writing
    # ~/.config/nvim/init.lua, so our hand-written init.lua is never clobbered.
    sideloadInitLua = true;

    extraPackages = with pkgs; [
      gcc
      nodejs
      unzip
      curl
      tree-sitter
    ];
  };

  # Symlink the whole config dir to the live repo (writable, unlike the
  # read-only nix store), so lazy.nvim can write lazy-lock.json and edits
  # to repo files take effect without a rebuild.
  home.activation.nvimConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    # Replace anything at the target (stale store symlinks from previous
    # generations) with a live symlink into the repo, so lazy.nvim can write
    # lazy-lock.json.
    rm -rf "$HOME/.config/nvim"
    mkdir -p "$HOME/.config"
    ln -s "$HOME/dotfiles/config/nvim" "$HOME/.config/nvim"
  '';
}