# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Flipt < Formula
  desc "Enterprise-ready, GitOps enabled, CloudNative feature management solution"
  homepage "https://flipt.io"
  version "1.52.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/flipt-io/flipt/releases/download/v1.52.0/flipt_darwin_x86_64.tar.gz"
      sha256 "ccc9c6e346c67efcdd1fdeaa2ad93d9fb21021bae68b22155c2d74534139d8eb"

      def install
        bin.install "flipt"
        output = Utils.popen_read("SHELL=bash #{bin}/flipt completion bash")
        (bash_completion/"flipt").write output
        output = Utils.popen_read("SHELL=zsh #{bin}/flipt completion zsh")
        (zsh_completion/"_flipt").write output
      end
    end
    on_arm do
      url "https://github.com/flipt-io/flipt/releases/download/v1.52.0/flipt_darwin_arm64.tar.gz"
      sha256 "348ee58afddf3e6fd0ee2077f5a4c13201beb567497f34bb806c9831ba604d26"

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
        url "https://github.com/flipt-io/flipt/releases/download/v1.52.0/flipt_linux_x86_64.tar.gz"
        sha256 "03eab25433ec0da3de0b1e4353feaebfe7dca61a25df0c86ededd4e1093dbf69"

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
        url "https://github.com/flipt-io/flipt/releases/download/v1.52.0/flipt_linux_arm64.tar.gz"
        sha256 "7146b9d0e58ecb2442631d548767e41996b84a4ce35510bf0eeca3ba5c3c938f"

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
