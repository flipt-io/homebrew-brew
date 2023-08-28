class Cup < Formula
  desc "A CLI for communicating with cupd"
  homepage "https://cup.flipt.io"
  license "apache-2.0"
  url "https://github.com/flipt-io/cup/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "8a92c7d849bbbba13f1e3c47918cb2cd13bc9b147433fa69e6dc968b99e3585a"

  depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/cup/."
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test cup`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/cup"
  end
end
