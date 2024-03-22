{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Use the fish shell
  programs.fish.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Mexico_City";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

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

  # Configure console keymap
  console.keyMap = "la-latin1";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;

  };
# Enable bluetooth
hardware.bluetooth.enable = true; # enables support for Bluetooth
hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
services.blueman.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.math = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "Work";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
  nerdfonts
];

services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
## List of necessary and useful utilities for hyprland"
        (callPackage ./sddm-rose-pine.nix {})
  	kitty
	waybar
	hyprpaper
	mako
	ranger
	rofi-wayland
	sddm-chili-theme
	starship
	xdg-desktop-portal-hyprland
##############################################
  	neovim
	git
  	texliveFull
	latexrun
	zathura
	wl-clipboard
	brightnessctl
  ];

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


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
