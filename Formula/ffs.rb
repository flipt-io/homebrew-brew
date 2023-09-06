class Ffs < Formula
  desc "Flipt Flag Search"
  homepage "https://flipt.io"
  version "0.0.18"
  license "Apache-2.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/flipt-io/ffs/releases/download/v#{version}/ffs-aarch64-apple-darwin.tar.gz"
      sha256 "a486e4e0890fc53b4cdb20ef16a94da6c464c1c19485133826ae9d4ae9cd2b87"

      def install
        bin.install "ffs"
      end
    end
  end
end
