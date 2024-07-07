{pkgs, ...}: {
  environment.systemPackages = with pkgs; [pavucontrol];
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
