{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    docker
    docker-slim
    docker-sbom
    docker-buildlx
    docker-compose
    nerdctl
    dive
    docker-ls
    crane
  ];

  virtualization = {
    docker = {
      enable = true;
    };
  };
}
