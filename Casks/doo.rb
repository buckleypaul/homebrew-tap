cask "doo" do
  version "0.3.0"
  sha256 "75b624b1b287acb94be296fe1ce09ab25c7762e680658a502291d4884fdaeccc"

  url "https://github.com/buckleypaul/doo/releases/download/v#{version}/Doo.zip"
  name "Doo"
  desc "Minimal local-first todo app for macOS"
  homepage "https://github.com/buckleypaul/doo"

  depends_on macos: ">= :sequoia"

  app "Doo.app"

  binary "#{appdir}/Doo.app/Contents/MacOS/DooCLI", target: "doo"

  zap trash: [
    "~/.local/share/doo",
    "~/.config/doo",
  ]
end
