{config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Use the fish shell
  programs.fish.enable = true;

  # Configure console keymap
  console.keyMap = "la-latin1";
}
