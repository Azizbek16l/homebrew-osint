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

  # macOS Intel binary not in v4.1.0 (CI macos-13 runner queue >6h on free tier).
  # Intel users: `pipx install mytools-osint==4.1.0`.
  on_macos do
    on_arm do
      url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-macos-arm64"
      sha256 "da9e228d3c5b8e4f8a96145876fef8f4fda80434c941572939ced50339acd323"
    end
  end

  on_linux do
    url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-linux-x86_64"
    sha256 "5d1d8c081d196a2d7a393b52c5e8a24341233ae0f2f20fe1c1d778570188d2fc"
  end

  def install
    bin.install Dir["osint-*"].first => "osint"
  end

  test do
    assert_match "mytools-osint", shell_output("#{bin}/osint --version")
  end
end
