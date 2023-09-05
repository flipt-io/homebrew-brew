class Ffs < Formula
  desc "Flipt Flag Search"
  homepage "https://flipt.io"
  version "0.0.17"
  license "Apache-2.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/flipt-io/ffs/releases/download/v#{version}/ffs-aarch64-apple-darwin.tar.gz"
      sha256 "9c7ddbee01ea43bfb6d45c9d3b58fe0140f596d8c6e5244bb27e6d974fe2b541"

      def install
        bin.install "ffs"
      end
    end
  end
end
