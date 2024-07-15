
{pkgs, ...}: {
  home.sessionVariables = {
    SASS_PATH = "${pkgs.dart-sass}/bin/dart-sass";
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
  ];
}
