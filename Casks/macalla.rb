cask "macalla" do
  version "0.2.1"
  sha256 "f2ec04d72f6f8f68beb0231cd4371075a4b20ae2151b8afd604b8ddd0f1b8170"

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

  # The login item is left alone on uninstall, because brew upgrade runs the
  # old version's uninstall first and would switch "Open at login" off.
  uninstall quit: "dev.macalla.desktop"

  zap launchctl: "dev.macalla.desktop.login",
      trash:     [
        "~/Library/Application Support/dev.macalla.desktop",
        "~/Library/Application Support/Macalla",
        "~/Library/Caches/dev.macalla.desktop",
        "~/Library/LaunchAgents/dev.macalla.desktop.login.plist",
        "~/Library/Preferences/dev.macalla.desktop.plist",
        "~/Library/WebKit/dev.macalla.desktop",
      ]
end
