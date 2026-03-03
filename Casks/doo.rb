cask "doo" do
  version "0.4.0"
  sha256 "3a8a4465e5077cdae87895855fc82a71a99ad5095783f3f0e012433429ed5caa"

  url "https://github.com/buckleypaul/doo/releases/download/v#{version}/Doo.zip"
  name "Doo"
  desc "Minimal local-first todo app for macOS"
  homepage "https://github.com/buckleypaul/doo"

  depends_on macos: ">= :sequoia"

  app "Doo.app"

  binary "#{appdir}/Doo.app/Contents/MacOS/DooCLI", target: "doo"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Doo.app"]
  end

  zap trash: [
    "~/.local/share/doo",
    "~/.config/doo",
  ]
end
