class Cup < Formula
  desc "A CLI for communicating with cupd"
  homepage "https://cup.flipt.io"
  license "apache-2.0"
  url "https://github.com/flipt-io/cup/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "8a92c7d849bbbba13f1e3c47918cb2cd13bc9b147433fa69e6dc968b99e3585a"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/cup/."
  end

  test do
    system "#{bin}/cup"
  end
end
