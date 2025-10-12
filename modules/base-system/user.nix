{
  config,
  pkgs,
  lib,
  ...
}: {
  users = {
    users.colin = {
      isNormalUser = true;
      description = "Colin Cockburn";
      extraGroups = ["networkmanager" "wheel" "plugdev"];
      packages = with pkgs; [
		pinentry
        gh
        gnupg
        just
        rename
        stow
      ];
    };
  };
  services.pcscd.enable = true;
  programs.gnupg.agent = {
	  enable = true;
	  pinentryPackage = pkgs.pinentry-all;
	  enableSSHSupport = true;
  };
}
