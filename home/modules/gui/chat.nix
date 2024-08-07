{pkgs, ...}: {
  home.packages = with pkgs; [
    telegram-desktop
    vesktop
    ferdium
    slack
  ];
}
