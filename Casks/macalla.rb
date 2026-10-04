cask "macalla" do
  version "0.1.0"
  sha256 "3f9e9bbec515ccde8cf6fbf576d6868369ab5823c9cd55a62184313b2f437519"

  url "https://github.com/ogham-mcp/macalla/releases/download/v#{version}/Macalla_#{version}_aarch64.dmg"
  name "Macalla"
  desc "Local-first voice dictation with a dictionary of your own words"
  homepage "https://macalla.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Macalla.app"

  uninstall launchctl: "dev.macalla.desktop.login",
            quit:      "dev.macalla.desktop"

  zap trash: [
    "~/Library/Application Support/dev.macalla.desktop",
    "~/Library/Application Support/Macalla",
    "~/Library/Caches/dev.macalla.desktop",
    "~/Library/LaunchAgents/dev.macalla.desktop.login.plist",
    "~/Library/Preferences/dev.macalla.desktop.plist",
    "~/Library/WebKit/dev.macalla.desktop",
  ]
end
