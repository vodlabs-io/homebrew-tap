class Vod < Formula
  desc "Command-line live stream recorder for 50+ platforms (VodLabs Recorder)"
  homepage "https://vodlabs.io/features/command-line/"
  version "0.0.30"
  license "PolyForm-Noncommercial-1.0.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/vodlabs-io/recorder/releases/download/v#{version}/cli_darwin_arm64.tar.gz"
      sha256 "f44645c23f65b8ae786d2e8212b735ea16c7bc181b70f0022d617ef2db0f76ef"
    end
    on_intel do
      url "https://github.com/vodlabs-io/recorder/releases/download/v#{version}/cli_darwin_amd64.tar.gz"
      sha256 "6cfdf538524c321191aebe8b124b91ad6f5e101e724bf3454b0b83d4e5569e30"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/vodlabs-io/recorder/releases/download/v#{version}/cli_linux_arm64.tar.gz"
      sha256 "8bc716f2dffccf0ae1384c636f5aa2d827e140a21bd1e9e730a84759f757a44d"
    end
    on_intel do
      url "https://github.com/vodlabs-io/recorder/releases/download/v#{version}/cli_linux_amd64.tar.gz"
      sha256 "96eb901a6fb9eca3293808d17965946f38d6a6fd79ed9adb53b4a747a9c06fb1"
    end
  end

  def install
    bin.install "vod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vod --version")
  end
end
