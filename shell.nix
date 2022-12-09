{ sources ? import ./nix/sources.nix, pkgs ? import sources.nixpkgs { } }:
let
  srvc = pkgs.rustPlatform.buildRustPackage rec {
    pname = "srvc";
    version = "3599eedbdc403ef25b01a73f1c4dcd5e994fd4ba";

    src = pkgs.fetchFromGitHub {
      owner = "insilica";
      repo = "rs-srvc";
      rev = "${version}";
      sha256 = "sha256-BBotqS/w2aXACOWFuHfInmKne3Tn+LiH7o6oet1TR9A=";
    };

    cargoSha256 = "sha256-eZIJCVioXUjPnwXAAiR/hGmwsOjqCo7llbMMGRe2rl4=";

    nativeBuildInputs = [ pkgs.webfs ];
  };
in with pkgs; mkShell { buildInputs = [ srvc ]; }
