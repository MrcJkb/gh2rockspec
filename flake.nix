{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };


  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {

        packages = rec {
          default = gh2rockspec;

            # pname = "gh2rockspec";
            # version = "0.1";
            # src = ./.;

            # meta = with pkgs; {
            #   description = "gh2rockspec generates a Luarocks package (.rockspec) from github metadata";
            #   homepage = "https://github.com/teto/gh2rockspec";
            #   platforms = lib.platforms.linux;
            #   license = lib.licenses.gpl2;
            #   maintainers = with lib.maintainers; [ teto ];
            # };
          gh2rockspec = pkgs.writers.writePython3Bin "gh2rockspec" { } ./main.py;
        };
      });
}
