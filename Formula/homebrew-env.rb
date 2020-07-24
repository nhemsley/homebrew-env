# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
# require 'ruby-debug'
class HomebrewEnv < Formula
  desc "Shell environment load support for homebrew"
  homepage "https://github.com/nhemsley/homebrew-env"
  url "https://github.com/nhemsley/homebrew-env.git"
  license ""
  version "0.01"

  def install
    bin.install "bin/brew-env.rb"

    config_dir.install "etc/cache"
    config_dir.install "etc/presets.yaml"

  end

  def config_dir
    etc/"brew-env"
  end

test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test homebrew-env`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
