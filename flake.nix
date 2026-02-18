{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    flake-utils.url = "github:numtide/flake-utils";

    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    rust-overlay,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachSystem flake-utils.lib.allSystems (system: let
      pkgs = import nixpkgs {
        inherit system;

        config.allowUnfree = true;

        overlays = [(import rust-overlay)];
      };
    in {
      devShells.default = pkgs.mkShell {
        name = "CHANGE_ME_NAME";
        packages = with pkgs; [
          (rust-bin.stable.latest.default.override {
            extensions = ["rust-src"];
          })
        ];
      };
    });
}
