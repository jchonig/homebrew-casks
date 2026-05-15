# My homebrew casks

This contains Casks that I am developing, or that are not suitable to
be pushed upstream.

## Development

```
brew tap jchonig/casks
```

| Target | What it does |
|---|---|
| `make style` | Check cask style (run before committing) |
| `make style-fix` | Auto-correct style issues |
| `make audit` | Audit casks (requires the tap to be registered) |
| `make test` | Full test suite: style + audit |
| `make update` | Fetch latest versions and update all cask files |

A pre-commit hook runs `make style` automatically. If it fails, run
`make style-fix` to auto-correct, then re-stage the fixed files.

CI runs `make test` on every push or pull request that touches a cask file.
`make update` is run daily by CI and can also be run locally; scripts that
cannot reach their upstream (e.g. due to network restrictions) skip silently.

## AntScope2

[AntScope2](https://rigexpert.com/products/software/antscope2/) is antenna
analyzer software from [RigExpert](https://rigexpert.com/).  Installs the
appropriate build for your macOS version (Sequoia or later vs. Sonoma and
earlier).

## HamClockLauncher

[HamClockLauncher](https://huberthickman.github.io/HamClockLauncher/)
is a macOS launcher for
[HamClock](https://www.clearskyinstitute.com/ham/HamClock/).
