class Haide < Formula
  desc "AI File Exclusion Manager for Git"
  homepage "https://github.com/buckleypaul/haide"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/buckleypaul/haide/releases/download/v0.1.0/haide_0.1.0_darwin_arm64.tar.gz"
      sha256 "3745cba93a119e59468defa70962f42e4db10c0a1022b5c36a4c0f73372ffa1c"

      def install
        bin.install "haide_darwin_arm64" => "haide"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/buckleypaul/haide/releases/download/v0.1.0/haide_0.1.0_darwin_amd64.tar.gz"
      sha256 "e8e63e58e6174545f339121cb7f65deb01f2759d1e35d9baae3ab5678f8c0f08"

      def install
        bin.install "haide_darwin_amd64" => "haide"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/buckleypaul/haide/releases/download/v0.1.0/haide_0.1.0_linux_arm64.tar.gz"
      sha256 "57f26554c5cae549865a9b778b41aa7500e103c6c74bc1482d45ba2e5c0c01e0"

      def install
        bin.install "haide_linux_arm64" => "haide"
      end
    end

    if Hardware::CPU.intel?
      url "https://github.com/buckleypaul/haide/releases/download/v0.1.0/haide_0.1.0_linux_amd64.tar.gz"
      sha256 "4f5fa1ba9596fa9b9cf8bf426ca35db4d0b25b6b5c8c2d5c905be9d46fe0d8f9"

      def install
        bin.install "haide_linux_amd64" => "haide"
      end
    end
  end

  test do
    system "#{bin}/haide", "--help"
    assert_match "haide manages AI-specific file exclusions", shell_output("#{bin}/haide --help")
  end
end
