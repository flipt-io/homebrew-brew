# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Flipt < Formula
  desc "An open source, self-hosted feature flag solution"
  homepage "https://flipt.io"
  version "1.32.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/flipt-io/flipt/releases/download/v1.32.0/flipt_darwin_arm64.tar.gz"
      sha256 "3cb3e47fbe61e0a59ccc453a94d8a4d177075f28d294ae4c74082f5bc8ebf0b6"

      def install
        bin.install "flipt"
        output = Utils.popen_read("SHELL=bash #{bin}/flipt completion bash")
        (bash_completion/"flipt").write output
        output = Utils.popen_read("SHELL=zsh #{bin}/flipt completion zsh")
        (zsh_completion/"_flipt").write output
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/flipt-io/flipt/releases/download/v1.32.0/flipt_linux_arm64.tar.gz"
      sha256 "4778412148e6b336d7d5b935dbca77069a02b78430bd687bf801cd80721d57df"

      def install
        bin.install "flipt"
        output = Utils.popen_read("SHELL=bash #{bin}/flipt completion bash")
        (bash_completion/"flipt").write output
        output = Utils.popen_read("SHELL=zsh #{bin}/flipt completion zsh")
        (zsh_completion/"_flipt").write output
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/flipt-io/flipt/releases/download/v1.32.0/flipt_linux_x86_64.tar.gz"
      sha256 "eaa9e70a22d4351ad847adc9ef3b3f028e5176d3e4f3e4794444f69afcad5415"

      def install
        bin.install "flipt"
        output = Utils.popen_read("SHELL=bash #{bin}/flipt completion bash")
        (bash_completion/"flipt").write output
        output = Utils.popen_read("SHELL=zsh #{bin}/flipt completion zsh")
        (zsh_completion/"_flipt").write output
      end
    end
  end

  def post_install
    (var/"log/flipt").mkpath
  end

  service do
    run [opt_bin/"flipt"]
    environment_variables PATH: std_service_path_env
    keep_alive true
    error_log_path "#{var}/log/flipt/server-stderr.log"
    log_path "#{var}/log/flipt/server-stdout.log"
  end
end
