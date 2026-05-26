# Personal-tap formula for Bluetm.uz / mytools-osint.
#
# Usage:
#   brew tap Azizbek16l/osint
#   brew install mytools-osint
#
# This formula installs the CLI only (`osint` command). For the GUI, install
# the .pkg / .dmg directly from the GitHub release page.
class MytoolsOsint < Formula
  desc "Bluetm OSINT CLI v4.1 — entity graph + auto-pivot + active recon + AI"
  homepage "https://github.com/Azizbek16l/mytools-osint"
  version "4.1.0"
  license "MIT"

  # Linux binary lands here once CI v4.1.0 finishes. Until then, Linux
  # users: `pipx install mytools-osint==4.1.0` or grab v4.0.0 binary.
  on_macos do
    on_arm do
      url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-macos-arm64"
      sha256 "da9e228d3c5b8e4f8a96145876fef8f4fda80434c941572939ced50339acd323"
    end
  end

  def install
    bin.install Dir["osint-*"].first => "osint"
  end

  test do
    assert_match "mytools-osint", shell_output("#{bin}/osint --version")
  end
end
