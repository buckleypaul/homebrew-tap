class Doo < Formula
  desc "Minimal local-first todo app for macOS"
  homepage "https://github.com/buckleypaul/doo"
  url "https://github.com/buckleypaul/doo/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2982b055cb5e5a84759711fd1d73069d0ac175252f13ff16b71cdb3fcb8a31d8"
  license "MIT"

  depends_on macos: :sequoia

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox"
    bin.install ".build/release/Doo" => "doo"
  end

  test do
    assert_predicate bin/"doo", :executable?
  end
end
