class Vod < Formula
  desc "Command-line live stream recorder for 50+ platforms (VodLabs Recorder)"
  homepage "https://vodlabs.io/features/command-line/"
  version "0.0.29"
  license "PolyForm-Noncommercial-1.0.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/vodlabs-io/recorder/releases/download/v#{version}/cli_darwin_arm64.tar.gz"
      sha256 "5981f6c4d9381145ba5bbabd836b5fcea9c227805d6a2b1aed7992b6c1470102"
    end
    on_intel do
      url "https://github.com/vodlabs-io/recorder/releases/download/v#{version}/cli_darwin_amd64.tar.gz"
      sha256 "6f36234bf056a28cf755ad37afc21d739b5d70786b51c2f115daa2aa4b25ee24"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/vodlabs-io/recorder/releases/download/v#{version}/cli_linux_arm64.tar.gz"
      sha256 "bdb90ea2c9f7a4c0deb09b3c51fa7333b182c7c1a7e5f69fc0833f42d43680f3"
    end
    on_intel do
      url "https://github.com/vodlabs-io/recorder/releases/download/v#{version}/cli_linux_amd64.tar.gz"
      sha256 "51041e5a892b426bb2bf1e730134f5400b4582c8545ce9c6008772fe34ec18d7"
    end
  end

  def install
    bin.install "vod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vod --version")
  end
end
