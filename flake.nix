{
  description = "Locust Load Testing Tool Flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.locust = {
    url = "github:locustio/locust/dedd94cfd67435155bac1bca275422ce5260b69f";
    flake = false;
  };

  outputs = { self, nixpkgs, locust }@inputs:
    let
      overlay = import ./overlay.nix { inherit inputs self; };
      overlays = [ overlay ];

      pkgsForSystem = system:
        import nixpkgs {
          inherit overlays system;
          config.allowUnfree = true;
        };
      pkgs = pkgsForSystem "x86_64-linux";
    in
    rec {
      packages.x86_64-linux = {
        inherit (pkgs) locust;
      };
      defaultPackage.x86_64-linux = packages.x86_64-linux.locust;
    };
}
