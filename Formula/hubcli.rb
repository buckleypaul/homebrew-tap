class Hubcli < Formula
  desc "Terminal UI application for Hubble Network device management"
  homepage "https://github.com/buckleypaul/hubcli"
  url "https://github.com/buckleypaul/hubcli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "cbacf8bb0835b6962887f3b1d3d5a163f7c27de5c5d8236f2984e270cd34fd49"
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
