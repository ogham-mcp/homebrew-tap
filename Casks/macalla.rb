cask "macalla" do
  version "0.2.0"
  sha256 "533628d2f35ec8b92be91478117023ed7854e89f9ac881a89db6cf23bac7d240"

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
