# My homebrew casks

This contains Casks and Formulae that I am developing, or that are not
suitable to be pushed upstream.

## Development

```bash
brew tap jchonig/casks
```

| Target           | What it does                                                  |
|------------------|----------------------------------------------------------------|
| `make style`     | Check cask/formula style (run before committing)              |
| `make style-fix` | Auto-correct style issues                                     |
| `make audit`     | Audit casks and formulae (requires the tap to be registered)  |
| `make test`      | Full test suite: style + audit                                |
| `make update`    | Fetch latest versions and update all cask and formula files   |

A pre-commit hook runs `make style` automatically. If it fails, run
`make style-fix` to auto-correct, then re-stage the fixed files.

CI runs `make test` on every push or pull request that touches a cask or
formula file. `make update` is run daily by CI and can also be run locally;
scripts that cannot reach their upstream (e.g. due to network restrictions)
skip silently.

## AntScope2

[AntScope2](https://rigexpert.com/products/software/antscope2/) is antenna
analyzer software from [RigExpert](https://rigexpert.com/).  Installs the
appropriate build for your macOS version (Sequoia or later vs. Sonoma and
earlier).

## HamClockLauncher

[HamClockLauncher](https://huberthickman.github.io/HamClockLauncher/)
is a macOS launcher for
[HamClock](https://www.clearskyinstitute.com/ham/HamClock/).

## HTCommander

[HTCommander](https://github.com/Ylianst/HTCommander) is remote management
software for MeshCentral managed devices.

## graywolf

[graywolf](https://github.com/chrissnell/graywolf) is an APRS station
with a software modem, digipeater, iGate, and web UI. Installed as a
Formula (CLI binaries `graywolf` and `graywolf-modem`), not a Cask.
Prebuilt binaries are used for both macOS and Linux (arm64/x86_64).

As a background service, graywolf keeps its SQLite config database,
tile cache, and other state under `$(brew --prefix)/var/graywolf`, and
logs to `$(brew --prefix)/var/log/graywolf.log`. The web UI listens on
<http://127.0.0.1:8080>.

Start/stop it as a service (recommended for unattended digipeater/iGate
operation — this uses `launchd` on macOS and `systemd` on Linux):

```bash
brew services start graywolf
brew services stop graywolf
```

To run it interactively instead, use a dedicated working directory (its
config database and state are written relative to the current directory
when not run as a service):

```bash
mkdir -p ~/.graywolf && cd ~/.graywolf && graywolf
```

See the [handbook](https://chrissnell.com/software/graywolf/) for
configuration and operation details.

## fetchbox

[fetchbox](https://github.com/jchonig/docker-fetchbox) is an IMAP
attachment fetcher that uploads to WebDAV (Nextcloud). Installed as a
Formula (CLI binary `fetchbox`), not a Cask.
