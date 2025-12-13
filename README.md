### Personal flakes for server tooling.

### How to install!

Make sure nix is installed, personally I prefer Determinate Nix:

```bash
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate
```

Clone the repo:

```bash
git clone -b server-tooling https://github.com/infraflakes/nix-flakes.git server-tooling
```

Build home manager:

```bash
nix run .#homeConfigurations.<username>@<hostname>.activationPackage
```

---
