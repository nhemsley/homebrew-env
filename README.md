# homebrew-env


## Install

Tap the keg:

```bash
  brew tap nhemsley/homebrew-env https://github.com/nhemsley/homebrew-env.git
```

Install:

```bash
 brew install homebrew-env
```

Cache the shellenv:

```bash
  brew env recache
```

Put this in ~/.bashrc OR ~/.profile etc.

```bash
. $(brew env source-file)
```

Show the shellenv

```bash
  brew env shellenv
```


## Adding env presets

Edit $HOMEBREW_PREFIX/etc/brew-env/presets.yaml to create/change environment scripts.

They key is the same as the brew installed package name.

Not hard.

PR's welcome for presets.yaml updates, and anything else.
