class Zmkonfig < Formula
  desc "Native macOS keymap editor for ZMK keyboards"
  homepage "https://github.com/buckleypaul/zmkonfig"
  url "https://github.com/buckleypaul/zmkonfig/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "94a947996965d271abd83f9fad7f995dd162b1f4b1823a2253dcbf1fa40e2692"
  license "MIT"
  head "https://github.com/buckleypaul/zmkonfig.git", branch: "main"

  # The app shells out to `gh` for GitHub credentials rather than asking for a
  # token of its own; GitHubClient probes /opt/homebrew/bin/gh among others.
  depends_on "gh"

  # Bare symbol, not ">= :sequoia" — the string comparison form is deprecated
  # and now raises. The default comparator is already >=.
  depends_on macos: :sequoia

  def install
    # --disable-sandbox because Homebrew builds inside a sandbox-exec sandbox
    # and SwiftPM evaluates Package.swift inside one of its own. Nesting them
    # fails with "sandbox_apply: Operation not permitted", surfaced only as an
    # invalid manifest.
    args = ["bundle", "CONFIG=release", "SWIFTPM_FLAGS=--disable-sandbox"]

    # The Makefile reads VERSION from the newest `v*` tag. A release tarball
    # has no .git, so hand it in or the app calls itself 0.0.0-dev. A head
    # build is a clone and can read its own tags — and `version` is the literal
    # string "HEAD" there, which is not something to write into Info.plist.
    args << "VERSION=#{version}" unless build.head?

    system "make", *args

    prefix.install ".build/Zmkonfig.app"

    # opt_prefix, not prefix: the wrapper has to keep working across upgrades.
    (bin/"zmkonfig").write <<~SH
      #!/bin/bash
      exec /usr/bin/open -a "#{opt_prefix}/Zmkonfig.app" "$@"
    SH
  end

  def caveats
    <<~EOS
      Zmkonfig.app is installed in the Homebrew prefix rather than /Applications.
      Launch it with `zmkonfig`, or drag it to the Dock from:
        #{opt_prefix}/Zmkonfig.app

      Run `gh auth login` if you have not already — the app uses gh for the
      GitHub credentials it needs to push and to read Actions runs.

      Your Anthropic API key, if you set one, is stored in the keychain rather
      than in a file. Homebrew builds inside a sandbox that cannot reach the
      keychain, so this app is always signed ad hoc here even if you own a
      code-signing certificate. It runs fine, but each `brew upgrade` gives it
      a new code identity, so macOS asks once more for permission to read the
      saved key. To stop that, re-sign it with your own identity after
      installing or upgrading:

        codesign --force --sign "<your identity>" \\
          "#{opt_prefix}/Zmkonfig.app"

      `security find-identity -v -p codesigning` lists what you have.
    EOS
  end

  test do
    app = prefix/"Zmkonfig.app"
    assert_path_exists app/"Contents/MacOS/Zmkonfig"

    # The kit's resource bundle has to be inside Contents/Resources — it is the
    # only place codesign will seal a nested bundle, and AppResources looks
    # there. A build that dropped it launches and then cannot read a keycode.
    assert_path_exists app/"Contents/Resources/Zmkonfig_ZmkonfigKit.bundle"

    # Proves the VERSION override above actually reached Info.plist. A head
    # build passes no override and names itself "HEAD-<sha>", while the plist
    # gets whatever the clone's tags describe — so there, only check that
    # something plausible was written.
    plist = app/"Contents/Info.plist"
    plist_version = shell_output(
      "/usr/bin/plutil -extract CFBundleShortVersionString raw #{plist}",
    ).strip
    refute_empty plist_version
    assert_equal version.to_s, plist_version unless version.to_s.start_with?("HEAD")

    system "/usr/bin/codesign", "--verify", "--strict", app
  end
end
