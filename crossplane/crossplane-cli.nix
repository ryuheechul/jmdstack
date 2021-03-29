# this derivation is based on https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh
{ pkgs , artifactVersion ? "v1.1.0" }:

# TODO: support multi OS and arch - currently only darwin_amd64 is hard coded

with pkgs; let
  # fix this to adapt different arch - https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh
  os_arch = "darwin_amd64";
  artifactSha256 = "051vyfmdkf2nmxd3ry175cl3bb0hgklgq00vi2ym52sqyfaplwyl";
in
  # https://ops.functionalalgebra.com/nix-by-example/
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
