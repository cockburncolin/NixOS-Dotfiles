format:
	nix fmt .
rebuild:
	sudo nixos-rebuild switch --flake . --upgrade
update:
	nix flake update --commit-lock-file

upgrade: update
	just rebuild

