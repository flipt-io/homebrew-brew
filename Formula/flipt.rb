# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Flipt < Formula
  desc "Enterprise-ready, GitOps enabled, CloudNative feature management solution"
  homepage "https://flipt.io"
  version "1.47.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/flipt-io/flipt/releases/download/v1.47.0/flipt_darwin_x86_64.tar.gz"
      sha256 "53f2d9b3d2bc1c7b1146e3541190afa97124f3c2c29ca60b0414d833a7b6fe77"

      def install
        bin.install "flipt"
        output = Utils.popen_read("SHELL=bash #{bin}/flipt completion bash")
        (bash_completion/"flipt").write output
        output = Utils.popen_read("SHELL=zsh #{bin}/flipt completion zsh")
        (zsh_completion/"_flipt").write output
      end
    end
    on_arm do
      url "https://github.com/flipt-io/flipt/releases/download/v1.47.0/flipt_darwin_arm64.tar.gz"
      sha256 "53ca5d4900bebe0ccba381d6c24655dfdb82231449e0d55aa674146efd3ded7d"

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
        url "https://github.com/flipt-io/flipt/releases/download/v1.47.0/flipt_linux_x86_64.tar.gz"
        sha256 "5c4bd1985adbf8502650db204bf758306eb780151a40d988b0d6050e5cfc1cdb"

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
        url "https://github.com/flipt-io/flipt/releases/download/v1.47.0/flipt_linux_arm64.tar.gz"
        sha256 "d5990a9b96c186e5ac2276285af22167a0022d5ef5e9ac1b1a2a44ab9c96d544"

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
