class Hubcli < Formula
  desc "Terminal UI application for Hubble Network device management"
  homepage "https://github.com/buckleypaul/hubcli"
  url "https://github.com/buckleypaul/hubcli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "2b48dc37befbec7b7bc8ca2ece7e61f7cda752dbf6fb30d89b5c86351ddfae0b"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    ldflags = %W[
      -s -w
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/hubcli"
  end

  test do
    assert_predicate bin/"hubcli", :executable?
  end
end
