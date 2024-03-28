# `devenv-django`

This repo demonstrates using [devenv.sh](https://devenv.sh/) alongside [`poetry`](https://python-poetry.org/docs/) for building `Django` development environment.

Specifically,  `devenv` uses `nix` to install system level packages like `postgresql_14` from `nixpkgs` & `poetry` uses `pip` to install `Python` packages from `pypi`

> **Note**:  Also see https://github.com/nix-community/poetry2nix/ which converts `poetry` projects to `nix`,  this example uses both tools separately


---


## Installation

1. Install [`devenv.sh`](https://devenv.sh/getting-started)


---


## Usage

`devenv` enables defining scripts in `devenv.nix` that are automatically added to the shell path ...

- Run tests via `devenv test` (see [`devenv.sh`](https://devenv.sh/tests/) for more information)
- Launch a development server via `devenv up`
