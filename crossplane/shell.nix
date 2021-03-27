{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs;[
    minikube
    kubectl
    k9s
    kubernetes-helm
    terraform_0_14
  ];

  # Environment variables to set here - https://discourse.nixos.org/t/provide-environmental-variables-from-nix/3453/3
  KUBECONFIG = "./.kube/config";
}
