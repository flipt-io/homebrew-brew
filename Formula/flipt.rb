# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Flipt < Formula
  desc "An open source, self-hosted feature flag solution"
  homepage "https://flipt.io"
  version "1.31.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/flipt-io/flipt/releases/download/v1.31.0/flipt_darwin_arm64.tar.gz"
      sha256 "1dc126e557a64a57296b76bf4ff1a34a9c48619c309139cfb1421cbc2d20b30d"

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
      url "https://github.com/flipt-io/flipt/releases/download/v1.31.0/flipt_linux_arm64.tar.gz"
      sha256 "8aad895954e2a7277a430af42701cc41566a69b31e3d98c1a12acadd9137188f"

      def install
        bin.install "flipt"
        output = Utils.popen_read("SHELL=bash #{bin}/flipt completion bash")
        (bash_completion/"flipt").write output
        output = Utils.popen_read("SHELL=zsh #{bin}/flipt completion zsh")
        (zsh_completion/"_flipt").write output
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/flipt-io/flipt/releases/download/v1.31.0/flipt_linux_x86_64.tar.gz"
      sha256 "7eadb206a09b1a10e110d341dc9b1b108c8d585792151b621b67d00632ce8a67"

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
