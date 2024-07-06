{pkgs, ...}: {
  home.packages = with pkgs; [
    obsidian
    bitwarden-desktop
    gimp
    davinci-resolve
    vscode
  ];
}
