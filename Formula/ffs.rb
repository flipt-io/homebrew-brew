class Ffs < Formula
  desc "Flipt Flag Search"
  homepage "https://flipt.io"
  version "0.0.20"
  license "Apache-2.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/flipt-io/ffs/releases/download/v#{version}/ffs-aarch64-apple-darwin.tar.gz"
      sha256 "1d7a9a400f0183f6cc7a590fda0852b75d681f1f28e79a3fc1f4fbeedae7ac7c"

      def install
        bin.install "ffs"
      end
    end
  end
end
