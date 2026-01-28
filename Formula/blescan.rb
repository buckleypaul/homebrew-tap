class Blescan < Formula
  desc "Terminal UI application for scanning and analyzing BLE device advertisements"
  homepage "https://github.com/buckleypaul/blescan"
  url "https://github.com/buckleypaul/blescan/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "d8bb5dc15a5f0ab0dfa5a190725b25ae8219b8c409b69ef2cb48200994b0bb7d"
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
