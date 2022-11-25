{ sources ? import ./nix/sources.nix, pkgs ? import sources.nixpkgs { } }:
let
  srvc = pkgs.rustPlatform.buildRustPackage rec {
    pname = "srvc";
    version = "63d1aa554a8ef59ad0bf03eb02f23564256700a3";

    src = pkgs.fetchFromGitHub {
      owner = "insilica";
      repo = "rs-srvc";
      rev = "${version}";
      sha256 = "sha256-0hECLJMeaoMCBnElDKF0ca7cpXN57MCW68rf1AQ82cA=";
    };

    cargoSha256 = "sha256-aI0Ijauu6oURw8BBsmHPVu7pFjCiuycIftFi276PEmo=";

    nativeBuildInputs = [ pkgs.webfs ];
  };
in with pkgs; mkShell { buildInputs = [ srvc ]; }
