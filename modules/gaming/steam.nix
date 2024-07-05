{
programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
};
programs.steam.package = pkgs.steam.override {
    withPrimus = true;
    extraPkgs = pkgs: [ bumblebee glxinfo ];
  };
  programs.java.enable = true; 
  programs.steam.package = pkgs.steam.override { withJava = true; };
  programs.steam.gamescopeSession.enable = true;
}
