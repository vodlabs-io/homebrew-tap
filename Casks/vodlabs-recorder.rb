cask "vodlabs-recorder" do
  arch arm: "arm64", intel: "x64"

  version "0.0.30"
  sha256 arm:   "3efd0e1b1b43a0541b55927c2b2640445f726a077322ca355290f63e24926d60",
         intel: "6a0fb8c36d43be0ad3a4885a2fcbb16b778edd808b07df1ab20698960550b0ca"

  url "https://github.com/vodlabs-io/recorder/releases/download/v#{version}/VodLabs-Recorder-macOS-#{arch}.dmg"
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
