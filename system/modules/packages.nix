{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    tldr
    xdg-utils
    ffmpeg
    btop
    firefox
    vscode
    brave
    librewolf
    # neofetch
    spotify
    playerctl
    gimp
    feh
    libnotify
    gping # ping with a graph
    trippy # network diagnostic https://github.com/fujiapple852/trippy
    #thefuck
    xpad
    bottles
    kgpg
    hyfetch
    google-chrome
  ];
}
