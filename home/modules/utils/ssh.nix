{ config, lib, pkgs, ... }:

let
  mkSshHost = { name, hostname ? null, user ? null, identityFile ? "~/.ssh/id_ed25519", extraOptions ? {} }:
    {
      inherit name;
      value = {
        hostname = hostname;
        user = user;
        identityFile = identityFile;
      } // extraOptions;
    };

  sshHosts = map mkSshHost [
    { name = "gitlab.com"; }
    { name = "github.com"; }
    { name = "usg"; hostname = "10.0.1.1"; user = "Nagashi"; }
    { name = "ap-sala"; hostname = "10.0.0.3"; user = "Rafael"; }
    { name = "ap-escritorio"; hostname = "10.0.0.2"; user = "Rafael"; }
    { name = "raspi-zero-rebordinho"; hostname = "100.92.254.40"; user = "rafaribe"; identityFile = "~/.ssh/id_rsa"; }
    { name = "raspi-zero-teivas"; hostname = "100.73.163.110"; user = "rafaribe"; identityFile = "~/.ssh/id_rsa"; }
    { name = "raspi-zero-pai"; hostname = "100.75.245.78"; user = "rafaribe"; identityFile = "~/.ssh/id_rsa"; }
    { name = "bs"; hostname = "10.0.0.11"; user = "rafaribe"; }
    { name = "bee"; hostname = "100.73.200.28"; user = "pi"; }
    { name = "duck"; hostname = "100.97.184.75"; user = "pi"; }
    { name = "banana"; hostname = "100.96.88.86"; user = "pi"; }
    { name = "unifi"; hostname = "52.143.13.146"; user = "neo"; identityFile = "~/.ssh/id_rsa"; }
    { name = "pi-desk"; hostname = "20.0.0.30"; user = "pi"; }
    { name = "truenas"; hostname = "10.0.0.6"; user = "root"; }
    { name = "nt"; hostname = "10.0.0.254"; user = "rafaribe"; }
    { name = "pve"; hostname = "10.0.0.2"; user = "root"; }
    { name = "amaterasu"; hostname = "192.168.1.2"; user = "rafaribe"; }
  ];

in {
  programs.ssh = {
    enable = true;
    forwardAgent = true;
    matchBlocks = builtins.listToAttrs sshHosts;
    extraConfig = ''
      PreferredAuthentications publickey
    '';
  };
}
