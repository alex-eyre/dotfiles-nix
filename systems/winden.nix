{ pkgs, config, ... }: {
  imports = [ ../os/darwin <home-manager/nix-darwin> ];
  networking.hostName = "winden";
  nix.trustedUsers = [ "alex" ];
  services.nix-daemon.enable = false;
}
