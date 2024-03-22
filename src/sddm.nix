{config, pkgs, ...}:

{
 # Enable the X11 windowing system.
  services.xserver.enable = true;

 #Enable the sddm login manager               
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.theme = "rose-pine";

  # Configure keymap in X11
  services.xserver = {
    layout = "latam";
    xkbVariant = "";
  };
}
