# Tweakio App
Search for jailbreak packages globally from a designated app. Relies on [Tweakio](https://github.com/SpartacusDev/Tweakio)

The app is just a shell: Tweakio hooks `TWAppDelegate` in the `com.spartacus.tweakioapp`
bundle (see the `Filter` list in Tweakio's `Tweakio.plist`) and installs the Tweakio view
controller as the root view controller, so the app needs the tweak to do anything.

## Jailbreaks
Built from a single source tree for both package layouts:

| Jailbreak | Layout | Build |
| --- | --- | --- |
| Dopamine, palera1n, roothide (iOS 15/16) | rootless, `/var/jb` | `make package ROOTLESS=1 FINALPACKAGE=1` |
| unc0ver, checkra1n, Taurine (iOS 12-14) | rootful, `/` | `make package FINALPACKAGE=1` |

Applications default to `/Applications`; the theos rootless scheme moves that to
`/var/jb/Applications`, which is where `uicache` registers apps on those jailbreaks,
so no extra code is needed. The `.deb` depends on Tweakio itself, which needs
`mobilesubstrate` – ElleKit provides that on Dopamine.

Prebuilt `.deb`s for both layouts are produced by the
[Build workflow](.github/workflows/build.yml) and attached to each workflow run.

## Building
Requires [Theos](https://github.com/theos/theos) cloned **recursively** – `libroot` and
the substrate stub live in submodules:

```sh
git clone --recursive https://github.com/theos/theos.git ~/theos
export THEOS=~/theos
make package ROOTLESS=1 FINALPACKAGE=1   # or: make package FINALPACKAGE=1
```
