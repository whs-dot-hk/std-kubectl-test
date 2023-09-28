{
  inputs.kubenix.url = "github:hall/kubenix";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.std.url = "github:divnix/std";

  outputs = {std, ...} @ inputs:
    std.growOn {
      inherit inputs;
      cellsFrom = ./nix;
      cellBlocks = with std.blockTypes; [
        (kubectl "deployments")
      ];
    };
}
