{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (python3.withPackages (ps:
      with ps; [
        requests
        gitpython
        tldextract
        dns
        httpx
        h2
        websocket-client
        pymongo
        chess
        networkx
        pydot
        steam-run
      ]))
  ];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
}
