# VodLabs Homebrew tap

[Homebrew](https://brew.sh) packages for [VodLabs Recorder](https://vodlabs.io/),
the free live stream recorder.

```sh
# The desktop app (macOS 14 or later). Homebrew asks you to trust a cask
# from outside its own repositories before it installs it.
brew trust --cask vodlabs-io/tap/vodlabs-recorder
brew install --cask vodlabs-io/tap/vodlabs-recorder

# The vod command-line tool (macOS or Linux)
brew install vodlabs-io/tap/vod
```

The desktop app updates itself. Update `vod` with `brew upgrade vod`.

Source, documentation and issues: [vodlabs-io/recorder](https://github.com/vodlabs-io/recorder).
VodLabs Recorder is source-available under the
[PolyForm Noncommercial License 1.0.0](https://github.com/vodlabs-io/recorder/blob/main/LICENSE).

A scheduled workflow pins each new release, after verifying its build
attestations, within six hours of publication.
