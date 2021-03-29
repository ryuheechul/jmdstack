# Crossplane Test Drive

This is my attempt of writing a reproducible code by following [the guide](https://crossplane.io/docs/v1.1/getting-started/install-configure.html).

## Prerequisites

### With direnv + nix

If you are already using [nix](https://github.com/NixOS/nixpkgs) and [direnv](https://github.com/direnv/direnv), [shell.nix](./shell.nix) will be loaded via [.envrc](./.envrc) and you should be good to go.

### Without nix nor direnv

You will needs these:
- kubectl
- helm
- minikube
- terraform

You may look at [this](https://crossplane.io/docs/v1.1/getting-started/install-configure.html) for additional requirements.

## Play

Use [Makefile](./Makefile) to provision and run and teardown.

_even if you don't have `make` or you don't use it, you should still be able to infer which commands are doing what from [Makefile](./Makefile)_
