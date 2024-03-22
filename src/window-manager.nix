{config, pkgs,... }:

{
# XDG Portals
	xdg = {
	  autostart.enable = true;
	  portal = {
	    enable = true;
	    extraPortals = [
	      pkgs.xdg-desktop-portal
	      pkgs.xdg-desktop-portal-gtk
	    ];
	  };
	};


# Hyprland
	programs = {
	  hyprland = {
	    enable = true;
	    xwayland = {
	      enable = true;
	    };
	  };
	  };
}
