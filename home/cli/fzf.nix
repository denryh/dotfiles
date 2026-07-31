{ ... }:

{
  programs.fzf = {
    enable = true;

    enableZshIntegration = true;

    defaultCommand = "fd --type f";
    fileWidget.command = "fd --type f";
    changeDirWidget.command = "fd --type d";

    defaultOptions = [
      "--height=40%"
      "--border"
      "--preview='bat --style=numbers --color=always {}'"
    ];
  };
}
