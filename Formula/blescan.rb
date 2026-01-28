class Blescan < Formula
  desc "Terminal UI application for scanning and analyzing BLE device advertisements"
  homepage "https://github.com/buckleypaul/blescan"
  url "https://github.com/buckleypaul/blescan/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2778b67db0f9d6e49ca8e8c1f8e465674728e8d2445212a3c8650361002e303b"
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
