{lib, ...}: {
  programs.git = {
    enable = true;
    userName = "Rafael Ribeiro";
    userEmail = "rafael.ntw" + "@" + "gmail" + "." + "com"; # obsfuscate email to prevent webscrapper spam

    extraConfig = {
      core = {
        editor = "nvim";
        whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
      };
      delta = {
        enable = true;
        options = {"navigate" = true;};
      };
      diff.tool = "meld";
      web.browser = "librewolf";
      push.default = "tracking";
      push.autoSetupRemote = true;
      pull.rebase = false;
      rebase.autoStash = true;
      branch.autosetupmerge = true;
      init.defaultBranch = "main";
      rerere.enabled = true;
      color.ui = true;
      blame.date = "relative";
    };

    diff-so-fancy.enable = true;
    # difftastic.enable = true;

    ignores = [
      ".idea"
      ".venv"
      ".bloop"
      ".metals"
      ".bsp"
      "project/metals.sbt"
      "project/project"
      "**/*.worksheet.sc"
    ];
  };
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.zsh.shellAliases = lib.mkAfter {
    "g" = "git";
    "gs" = "git status";
    "ga" = "git add -A";
    "gf" = "git fetch";
    "gp" = "git push";
    "gl" = "git pull";
    "glr" = "git pull --rebase";
    "gc" = "git commit -v";
    "gca" = "git commit --amend";
    "gch" = "git commit --amend -C HEAD";
    "gac" = "git commit -av";
    "gb" = "git branch -v";
    "gba" = "git branch -va";
    "gcp" = "git cherry-pick";
    "glo" = "git l";
    "gco" = "git checkout";
    "gm" = "git merge";
    "gmt" = "git mergetool --no-prompt";
    "gd" = "git diff";
    "gr" = "git remote -v";
    "gcf" = "git clean -f";
    "grh" = "git reset --hard";
    "grhh" = "git reset --hard HEAD";
  };
}
