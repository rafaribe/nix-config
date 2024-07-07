{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    fzf
    fd
    jq
    bat
    httpie
    mosh
    dust
    psmisc # fuser
    lsof
    bind
    wine
    (lutris.override {
      extraLibraries =  pkgs: [
        # List library dependencies here
      ];
  ];

  # enable zsh completion for system packages
  environment.pathsToLink = ["/share/zsh"];

  # automount removable media
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.openssh = {
    enable = true;
    settings = {PasswordAuthentication = false;};
  };
}
