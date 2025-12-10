### Personal flakes for non-nixos setup.

### How to install!

Clone the repo:

```
git clone https://github.com/infraflakes/wsl-flakes.git
```

Build home manager:

```
nix run .#homeConfigurations.<username>@<hostname>.activationPackage
```

---
