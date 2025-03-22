# corekeeper-server

Wrapper scripts to run a Core Keeper dedicated server on Arch Linux

## Installing

Building depends on [steamcmd](https://aur.archlinux.org/packages/steamcmd) in order to
download the game files from Steam. This, in turn, will require
[multilib to be enabled](https://wiki.archlinux.org/title/Official_repositories#multilib)

Build and install using makepkg as you would with any AUR package:

```sh
cd corekeeper-server
makepkg -si
```

## Running

Start the server by running `corekeeper.service`

```sh
systemctl start corekeeper.service
```

If you want the server to launch at system startup, enable the service

```sh
systemctl enable corekeeper.service
```

You can find the game ID logged during startup

```sh
systemctl status corekeeper.service

...

Mar 21 20:18:53 pc launch.sh[858432]: Started CoreKeeper server with game ID abc123
```

## Configuration

Configuration options appear to be minimal, but you can find the game's config file at
`/opt/corekeeper/.config/unity3d/Pugstorm/Core\ Keeper/DedicatedServer/ServerConfig.json`
