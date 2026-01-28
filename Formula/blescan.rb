class Blescan < Formula
  desc "Terminal UI application for scanning and analyzing BLE device advertisements"
  homepage "https://github.com/buckleypaul/blescan"
  url "https://github.com/buckleypaul/blescan/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "5c0376864b0800dc15a6cb5f20c609da73c9c4890bca5ae163bec2c643946d35"
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
