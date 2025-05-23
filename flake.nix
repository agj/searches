{
  description = "Searches";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {system = system;};
      in {
        devShell = pkgs.mkShell {
          buildInputs = [
            pkgs.elmPackages.elm
            pkgs.elmPackages.elm-test
            pkgs.just
            pkgs.nodePackages.prettier
            pkgs.nodejs-slim_22
            pkgs.nushell
            pkgs.pnpm
            pkgs.qrtool
          ];
        };
      }
    );
}
