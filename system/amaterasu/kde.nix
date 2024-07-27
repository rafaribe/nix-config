{
  pkgs,
  config,
  ...
}: {
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  security.rtkit.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    gamescopeSession = {
      enable = true;
    };
  };
  services.samba.enable = true;

  system = {
    extraSystemBuilderCmds = ''
      ln -sv ${pkgs.path} $out/nixpkgs
    '';
  };

  wallpaper-engine-kde-plugin = with pkgs; stdenv.mkDerivation rec {
    pname = "wallpaperEngineKde";
    version = "96230de92f1715d3ccc5b9d50906e6a73812a00a";
    src = fetchFromGitHub {
      owner = "catsout";
      repo = "wallpaper-engine-kde-plugin";
      rev = version;
      hash = "sha256-vkWEGlDQpfJ3fAimJHZs+aX6dh/fLHSRy2tLEsgu/JU=";
      fetchSubmodules = true;
    };
    nativeBuildInputs = with kdePackages; [
      cmake
      extra-cmake-modules
      glslang-submodule
      pkg-config
      gst_all_1.gst-libav
      shaderc
      ninja # qwrapQtAppsHook
    ];
    buildInputs = [
      mpv
      lz4
      vulkan-headers
      vulkan-tools
      vulkan-loader
    ]
    ++ (with kdePackages; with qt6Packages; [
      qtbase
      # plasma-sdk
      kpackage
      kdeclarative
      # libplasma
      # plasma-workspace
      # kde-dev-utils
      plasma5support
      qt5compat
      qtwebsockets
      qtwebengine
      qtwebchannel
      qtmultimedia
      qtdeclarative
    ])
    ++ [ (python3.withPackages (python-pkgs: [ python-pkgs.websockets ])) ];
    cmakeFlags = [ "-DUSE_PLASMAPKG=OFF" ]; #"-DCMAKE_BUILD_TYPE=Release" "-DBUILD_QML=ON" "-DQT_MAJOR_VERSION=6" ];
    dontWrapQtApps = true;
    postPatch = ''
      rm -rf src/backend_scene/third_party/glslang
      ln -s ${glslang-submodule.src} src/backend_scene/third_party/glslang
    '';
    #Optional informations
    meta = with lib; {
      description = "Wallpaper Engine KDE plasma plugin";
      homepage = "https://github.com/Jelgnum/wallpaper-engine-kde-plugin";
      license = licenses.gpl2Plus;
      platforms = platforms.linux;
    };
  };
  environment.systemPackages = with pkgs; with kdePackages; [
    ### wallpaper-engine-plugin
    wallpaper-engine-kde-plugin
    ###
  ];
}
