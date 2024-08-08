{
  config,
  pkgs,
  lib,
  ...
}: {
  home.sessionVariables = {
    SASS_PATH = "${pkgs.dart-sass}/bin/dart-sass";
    TALOSCONFIG = "/home/rafaribe/code/rafaribe/home-ops/kubernetes/main/bootstrap/talos/clusterconfig/talosconfig";
  };
  home.packages = with pkgs; [
    k9s
    kubernetes-helm
    yq
    cilium-cli
    helmfile
    kustomize
    dive
    sops
    age
    crane
    clusterctl
    talosctl
    etcd # Interested to only get etcdctl
    fluxcd
    kubectl
  ];
  programs.zsh.shellAliases = lib.mkAfter {
    "t" = "talosctl";
  };
}
