# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Flipt < Formula
  desc "Enterprise-ready, GitOps enabled, CloudNative feature management solution"
  homepage "https://flipt.io"
  version "1.46.1"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/flipt-io/flipt/releases/download/v1.46.1/flipt_darwin_x86_64.tar.gz"
      sha256 "5bbd6294ea31db0d6a82e4e0aedc63f0547a83bd28ec78ab2191536f0d555533"

      def install
        bin.install "flipt"
        output = Utils.popen_read("SHELL=bash #{bin}/flipt completion bash")
        (bash_completion/"flipt").write output
        output = Utils.popen_read("SHELL=zsh #{bin}/flipt completion zsh")
        (zsh_completion/"_flipt").write output
      end
    end
    on_arm do
      url "https://github.com/flipt-io/flipt/releases/download/v1.46.1/flipt_darwin_arm64.tar.gz"
      sha256 "b9eb33d93dc404c063df3f5bf46e82c2d2df60e1c2d8892045b592dd39f6bc09"

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
        url "https://github.com/flipt-io/flipt/releases/download/v1.46.1/flipt_linux_x86_64.tar.gz"
        sha256 "146d39770c473e8022801ff5c6a5e73f7afddb86432e3166ed140f02daf3bd32"

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
        url "https://github.com/flipt-io/flipt/releases/download/v1.46.1/flipt_linux_arm64.tar.gz"
        sha256 "a342a348625188c2acd6d384838e41cdd0a1fd8a70bd771c2a592fe6ead69c13"

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
