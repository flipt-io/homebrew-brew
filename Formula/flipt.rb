# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Flipt < Formula
  desc "Enterprise-ready, GitOps enabled, CloudNative feature management solution"
  homepage "https://flipt.io"
  version "1.44.1"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/flipt-io/flipt/releases/download/v1.44.1/flipt_darwin_x86_64.tar.gz"
      sha256 "eb89b88d1e95cb2ca50f4970b78e0d74d3f1016909c198f668c787c68f019a57"

      def install
        bin.install "flipt"
        output = Utils.popen_read("SHELL=bash #{bin}/flipt completion bash")
        (bash_completion/"flipt").write output
        output = Utils.popen_read("SHELL=zsh #{bin}/flipt completion zsh")
        (zsh_completion/"_flipt").write output
      end
    end
    on_arm do
      url "https://github.com/flipt-io/flipt/releases/download/v1.44.1/flipt_darwin_arm64.tar.gz"
      sha256 "5a3606988271f6f6971000dbe096418fc88eb54ffc224f6b9cba95ced6616334"

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
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/flipt-io/flipt/releases/download/v1.44.1/flipt_linux_x86_64.tar.gz"
        sha256 "8138188b79a6080bd5e1b2af8a1a9e4e6e62344cf404166fd0c8694a3c386d8e"

        def install
          bin.install "flipt"
          output = Utils.popen_read("SHELL=bash #{bin}/flipt completion bash")
          (bash_completion/"flipt").write output
          output = Utils.popen_read("SHELL=zsh #{bin}/flipt completion zsh")
          (zsh_completion/"_flipt").write output
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/flipt-io/flipt/releases/download/v1.44.1/flipt_linux_arm64.tar.gz"
        sha256 "1a5d26335467662ee8a61e4f8b00fc8466aaa3a11918493f33a259a28da100d9"

        def install
          bin.install "flipt"
          output = Utils.popen_read("SHELL=bash #{bin}/flipt completion bash")
          (bash_completion/"flipt").write output
          output = Utils.popen_read("SHELL=zsh #{bin}/flipt completion zsh")
          (zsh_completion/"_flipt").write output
        end
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
