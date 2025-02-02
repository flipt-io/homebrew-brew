# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Flipt < Formula
  desc "Enterprise-ready, GitOps enabled, CloudNative feature management solution"
  homepage "https://flipt.io"
  version "1.54.2"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/flipt-io/flipt/releases/download/v1.54.2/flipt_darwin_x86_64.tar.gz"
      sha256 "502a95671d9a1cf32ddca42faa5ec4fa82cef3ece912290ceb468c06a9218889"

      def install
        bin.install "flipt"
        output = Utils.popen_read("SHELL=bash #{bin}/flipt completion bash")
        (bash_completion/"flipt").write output
        output = Utils.popen_read("SHELL=zsh #{bin}/flipt completion zsh")
        (zsh_completion/"_flipt").write output
      end
    end
    on_arm do
      url "https://github.com/flipt-io/flipt/releases/download/v1.54.2/flipt_darwin_arm64.tar.gz"
      sha256 "a79a6521a5a1c5b54a0f5a4fbe1cfd462470325710300abf1eb78cd0cce33b1c"

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
        url "https://github.com/flipt-io/flipt/releases/download/v1.54.2/flipt_linux_x86_64.tar.gz"
        sha256 "9fc3265c38b236d3af781b2f1c81f0e89d508f9ab71aaf77cc6e71df299f5764"

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
        url "https://github.com/flipt-io/flipt/releases/download/v1.54.2/flipt_linux_arm64.tar.gz"
        sha256 "6064f1040e4f9eaabd576945443648dcbe7fafed04a875467a3571ee1c934675"

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
