{config, ...}: {
  imports = [
    ./modules/cli
    ./modules/gui
    ./modules/utils
  ];

  home = rec {
    username = "rafaribe";
    homeDirectory = "/home/${username}";
    file.".local/bin".source =
      config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/dotfiles/scripts";
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
