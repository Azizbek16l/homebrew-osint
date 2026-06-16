# Personal-tap formula for Bluetm.uz / mytools-osint.
#
# Usage:
#   brew tap Azizbek16l/osint
#   brew install mytools-osint
#
# This formula installs the CLI only (`osint` command). For the GUI, install
# the .pkg / .dmg directly from the GitHub release page.
class MytoolsOsint < Formula
  desc "Bluetm OSINT CLI — chat shell, 7 themes, 51 modules, 1,008 sites, free APIs"
  homepage "https://github.com/Azizbek16l/mytools-osint"
  version "4.3.5"
  license "MIT"

  # macOS Intel (x86_64) binary not shipped this release (CI macos-13 leg).
  on_macos do
    on_arm do
      url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-macos-arm64"
      sha256 "ebce8cd76ed5cc3b96ac4d7059fafd75168613faff9334a8a3e535d80db2c2a8"
    end
  end

  on_linux do
    url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-linux-x86_64"
    sha256 "ce87e0b187a0075a9a265aaa659925ff3f6d1e0221698548164bbc3de775c5e5"
  end

  def install
    bin.install Dir["osint-*"].first => "osint"
  end

  test do
    assert_match "mytools-osint", shell_output("#{bin}/osint --version")
  end
end
