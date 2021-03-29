{ pkgs ? import <nixpkgs> {} }:

let
  crossplane-cli = import ./crossplane-cli.nix { pkgs=pkgs; };
in
  pkgs.mkShell {
    buildInputs = with pkgs;[
      minikube
      kubectl
      k9s
      kubernetes-helm
      terraform_0_14
      crossplane-cli
    ];

  # Environment variables to set here - https://discourse.nixos.org/t/provide-environmental-variables-from-nix/3453/3
  KUBECONFIG = "./.kube/config";
  DEBUG_NIX = builtins.currentSystem;
}
