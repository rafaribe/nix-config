# The idea is to symlink dotfiles/nvim into .config/nvim,
# because I don't want nix to manage my nvim config. LazyVim does it.
{
  pkgs,
}: {
  home.packages = with pkgs; [
    obsidian
    bitwarden-desktop
    bitwarden-cli   
  ];
}
