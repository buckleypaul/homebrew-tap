class Hubcli < Formula
  desc "Terminal UI application for Hubble Network device management"
  homepage "https://github.com/buckleypaul/hubcli"
  url "https://github.com/buckleypaul/hubcli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "a8c13f9a3578b391769cd723458a2e3abee7943332c5801e5cf555923360ee28"
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
