{pkgs, ...}: {
  home.packages = with pkgs; [
    vesktop
    ferdium
    slack
  ];
}
