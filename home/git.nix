{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "denryh";
        email = "dg.thdat.dev@gmail.com";
      };

      init = {
        defaultBranch = "main";
      };

      pull = {
        rebase = true;
      };

      push = {
        autoSetupRemote = true;
      };

      rerere = {
        enabled = true;
      };
    };
  };
}
