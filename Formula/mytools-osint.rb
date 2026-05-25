# Personal-tap formula for Bluetm.uz / mytools-osint.
#
# Usage:
#   brew tap Azizbek16l/osint
#   brew install mytools-osint
#
# This formula installs the CLI only (`osint` command). For the GUI, install
# the .pkg / .dmg directly from the GitHub release page.
class MytoolsOsint < Formula
  desc "Bluetm OSINT CLI — entity graph + auto-pivot + SIEM + AI (v4.0)"
  homepage "https://github.com/Azizbek16l/mytools-osint"
  version "4.0.0"
  license "MIT"

  # macOS Intel + Linux binaries land here as CI artifacts upload (Windows
  # binary published separately on the release page). Intel users without
  # the binary can: `pipx install mytools-osint==4.0.0`.
  on_macos do
    on_arm do
      url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-macos-arm64"
      sha256 "c7edd41f86826acb55cb869517c1ed283a5a1a8d3b7ead235309a5cd9f8871e7"
    end
  end

  def install
    bin.install Dir["osint-*"].first => "osint"
  end

  test do
    assert_match "mytools-osint", shell_output("#{bin}/osint --version")
  end
end
