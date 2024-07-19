{pkgs, ...}: {

  environment.systemPackages = with pkgs; [
    tailscale
  ];

  };

  # required for root user
}
