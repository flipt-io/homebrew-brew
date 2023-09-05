require "formula"
require_relative "../lib/download_strategy"

class Ffs < Formula
  desc "Flipt Flag Search"
  homepage "https://flipt.io"
  version "0.0.17"
  license "Apache-2.0"
  url "https://github.com/flipt-io/ffs/releases/download/v0.0.17/ffs-aarch64-apple-darwin.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "28d949fedb97ba22f5b926ede40c2f1ff5a2fb87e170fec5669cb17e95de8dbc"
  head "https://github.com/flipt-io/ffs.git"

  def install
    bin.install "ffs"
  end
end
