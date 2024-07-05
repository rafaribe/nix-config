{
  imports = [ ./minecraft.nix ];

  config = lib.mkIf programs.gaming.enable {
    home.packages = with pkgs; [
      mono
      winetricks
      mangohud
      lutris
    ];
  };
}
