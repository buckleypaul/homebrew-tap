class Blescan < Formula
  desc "Terminal UI application for scanning and analyzing BLE device advertisements"
  homepage "https://github.com/buckleypaul/blescan"
  url "https://github.com/buckleypaul/blescan/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "3e1502ad249ddd2aaf5bb42f1d77c31916de9c584a09bcebd8b6366ba5f51c16"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/blescan"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blescan --version")
  end
end
