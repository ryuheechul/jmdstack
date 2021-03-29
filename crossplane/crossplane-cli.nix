# this derivation is based on https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh
{ pkgs }:

with pkgs; let
  artifactVersion = "v1.1.0";
  systemSelector = builtins.currentSystem;
  coressponentArtifact = { # mimic switch case or match
    x86_64-darwin = {
      os_arch = "darwin_amd64";
      sha256 = "051vyfmdkf2nmxd3ry175cl3bb0hgklgq00vi2ym52sqyfaplwyl";
    };
    x86_64-linux = {
      os_arch = "linux_amd64";
      sha256 = "0rp9q5dl4974p3c65i7w53j7g8h7b9rd260yc9qhlhhc69a92al4";
    };
    aarch64-linux = {
      os_arch = "linux_arm64";
      sha256 = "1bx43q2v19xmrkr82rlc8j5h80dixxx3bf2g10ni0hvl86q5fv76";
    };
  }.${systemSelector} or {};
  os_arch = coressponentArtifact.os_arch;
  artifactSha256 = coressponentArtifact.sha256;
in
  # https://ops.functionalalgebra.com/nix-by-example/
  if builtins.hasAttr "os_arch" coressponentArtifact then
  stdenv.mkDerivation rec {
    name = "crossplane-cli";
    version = "${artifactVersion}";

    src = fetchurl {
      url = "https://releases.crossplane.io/stable/${artifactVersion}/bin/${os_arch}/crank";
      sha256 = "${artifactSha256}";
    };

    phases = "installPhase";

    installPhase = ''
      mkdir -p $out/bin
      cp ${src} $out/bin/kubectl-crossplane
      chmod +x $out/bin/kubectl-crossplane
    '';
  }
  else
  builtins.throw ''
    Failed to install crossplane cli.
    "${systemSelector}" system is not supported this nix derivation.
  ''
