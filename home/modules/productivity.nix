{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    obsidian
    bitwarden-desktop
    bitwarden-cli
  ];
}
