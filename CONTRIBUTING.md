# Contributing to Equestria OS (ISO profile)

Thank you for wanting to help! This repository is the archiso profile that
builds the Equestria OS live ISO. The tools and packages themselves live in
[equestria-os-packages](https://github.com/Lucia7Lunadottir/equestria-os-packages).

## Before you start

* **Bugs:** open an Issue with your GPU model, laptop/desktop model, boot mode
  (UEFI or BIOS), and the ISO date.
* **Anything non-trivial:** open an Issue first so we agree on the approach
  before you spend time on it.

## Building and testing

* `./build.sh` builds the ISO into `~/equestria-out` (needs `archiso`).
* `./test-vm.sh` boots the newest ISO in QEMU/KVM (`BIOS=1` for BIOS mode).

## Sending changes

1. Fork the repository and create a branch for your change.
2. Keep each pull request about one thing.
3. Build the ISO and boot it in a VM before opening the pull request.
4. Sign off every commit (see below) and open a pull request.

## License of contributions

All code in this repository is licensed under the
[GNU GPL v3 or later](LICENSE). By contributing, you agree that your
contribution is licensed under the same terms.

## Developer Certificate of Origin

Every commit must be signed off — add `-s` to `git commit`:

```
git commit -s -m "Add missing firmware package"
```

This adds a `Signed-off-by: Your Name <you@example.com>` line, which certifies
that you wrote the change or otherwise have the right to submit it under the
project's license, as described in the
[Developer Certificate of Origin 1.1](https://developercertificate.org/).

## Names and branding

Please read [TRADEMARKS.md](TRADEMARKS.md) before redistributing a modified
version of Equestria OS.
