cask "doo" do
  version "0.2.0"
  sha256 "PLACEHOLDER_REPLACE_AFTER_FIRST_RELEASE"

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
