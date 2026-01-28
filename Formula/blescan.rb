class Blescan < Formula
  desc "Terminal UI application for scanning and analyzing BLE device advertisements"
  homepage "https://github.com/buckleypaul/blescan"
  url "https://github.com/buckleypaul/blescan/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f2af1d83caed7e77965813dd1edfa29b042ac3d1688555fb22db7ad47bd3386e"
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
    assert_match version.to_s, shell_output("#{bin}/blescan --version 2>&1", 1)
  end
end
