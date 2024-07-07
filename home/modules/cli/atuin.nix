{
  lib,
  config,
  osConfig,
  ...
}: {
  programs.atuin = {
    enable = true;

    enableBashIntegration = config.programs.bash.enable;
    enableFishIntegration = config.programs.fish.enable;
    enableZshIntegration = config.programs.zsh.enable;
    enableNushellIntegration = config.programs.nushell.enable;

    flags = ["--disable-up-arrow"];
    settings = {
      dialect = "pt";
      show_preview = true;
      inline_height = 30;
      style = "compact";
      update_check = false;
      sync_address = "https://atuin.rafaribe.com";
      sync_frequency = "5m";
    };
  };
}
