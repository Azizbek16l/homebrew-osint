# Personal-tap formula for Bluetm.uz / mytools-osint.
#
# Usage (once tap is created):
#   brew tap Azizbek16l/osint
#   brew install mytools-osint
#
# This formula installs the CLI only (`osint` command). For the GUI, install
# the .pkg / .dmg directly from the GitHub release page.
class MytoolsOsint < Formula
  desc "Bluetm OSINT CLI — 24 free-source modules, red-team profiles, TUI, HTML reports"
  homepage "https://github.com/Azizbek16l/mytools-osint"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-macos-arm64"
      sha256 "3147932fe14826e5af58ed2abee0f2a1286a1ba54146a90e81036f6be9c6648a"
    end
    on_intel do
      url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-macos-x86_64"
      sha256 "REPLACE_WITH_ACTUAL_INTEL_SHA256_AFTER_RELEASE"
    end
  end

  on_linux do
    url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-linux-x86_64"
    sha256 "cd76e63e7fc1983800e126203b236c1a4071985a6ffd3a228513ef134e2544fa"
  end

  def install
    bin.install Dir["osint-*"].first => "osint"
  end

  test do
    assert_match "mytools-osint", shell_output("#{bin}/osint --version")
  end
end
