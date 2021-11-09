# Podman for containers on macOS 🐳

Notes on setting up Podman as a better Docker replacement on macOS.

> 🚨 **WARNING**: This is a draft. Podman machines aren't usable as a drop-in Docker Desktop just
> yet due to [lack of host-level bind mounts](https://github.com/containers/podman/issues/8016).

## Motivation

- Docker for Mac has a number of issues for me, including a bloated Electron UI that I don't need,
  and recently also uncertainty about its payment model
- I prefer Podman and the RHEL/Fedora ecosystem in general
- Podman recently introduced `podman machine` which follows a similar intermediate Linux VM model
  as Docker for Mac (not to be confused with the old `podman-machine` tool this replaces)

## Setup

Install `podman` and `docker-compose` using Homebrew (see `Brewfile`).

Ensure `podman` is set up as Docker runtime in VS Code settings:

```json
{
  "remote.containers.dockerPath": "podman"
}
```

## Usage

```bash
# Create a new machine with a given resource configuration
podman machine init --cpus 2 --memory 8192 --disk-size 50

# Start and stop the machine
# (names are optional for default machine)
podman machine start [name]
podman machine stop [name]

# List running machines
podman machine ls

# Delete a machine
podman machine rm [name]
```

## Cockpit

Cockpit can be installed on the intermediate Fedora CoreOS VM for a nice UI to manage containers.

The [`podman-machine-setup-cockpit`](../tag-macos/bin/podman-machine-setup-cockpit) script in my
macOS dotfiles installs Cockpit, sets up port forwarding, enables password SSH login (required to
be able to sign in Cockpit), and sets a password of `core` for the `core` user

## Issues

### "Too many authentication failures"

After lots of creating and tearing down machines, SSH on a new machine fails with:

> Received disconnect from ::1 port 65203:2: Too many authentication failures

Prune old SSH keys from the SSH agent and add the default identity back after:

```bash
ssh-add -D
ssh-add --apple-use-keychain
```

See: https://github.com/containers/podman/issues/11847

## Links

- [RH: How Podman runs on Macs](https://www.redhat.com/sysadmin/podman-mac-machine-architecture)
- [RH: Podman and docker-compose](https://www.redhat.com/sysadmin/podman-docker-compose)
- [Podman with docker-compose on MacOS](https://gist.github.com/kaaquist/dab64aeb52a815b935b11c86202761a3)
