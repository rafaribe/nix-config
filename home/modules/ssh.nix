{...}: {
  programs.ssh = {
    enable = true;
    forwardAgent = true;
    extraConfig = ''
      Host amaterasu
        HostName 192.168.1.2
        User rafaribe
    '';
  };

  services.ssh-agent.enable = true;
}
