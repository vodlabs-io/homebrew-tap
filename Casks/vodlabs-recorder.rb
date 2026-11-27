cask "vodlabs-recorder" do
  arch arm: "arm64", intel: "x64"

  version "0.0.29"
  sha256 arm:   "fac330af5bdc8e27e1d69ace4a26151c4805a3bd107e38c453f8bf118b40b8d0",
         intel: "e17e9d94b20432884ec3cced6338923ba9ff96a99086d8945c49c9ba6dc96b9a"

  url "https://github.com/vodlabs-io/recorder/releases/download/v#{version}/VodLabs-Recorder-macOS-#{arch}.dmg",
      verified: "github.com/vodlabs-io/recorder/"
  name "VodLabs Recorder"
  desc "Records live streams from 50+ platforms automatically"
  homepage "https://vodlabs.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "VodLabs Recorder.app"

  zap trash: [
    "~/Library/Application Support/vodlabs/recorder",
    "~/Library/Caches/vodlabs/recorder",
    "~/Library/Preferences/com.vodlabs.recorder.plist",
    "~/Library/Saved Application State/com.vodlabs.recorder.savedState",
  ]
end
