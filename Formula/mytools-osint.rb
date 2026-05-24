# Personal-tap formula for Bluetm.uz / mytools-osint.
#
# Usage (once tap is created):
#   brew tap Azizbek16l/osint
#   brew install mytools-osint
#
# This formula installs the CLI only (`osint` command). For the GUI, install
# the .pkg / .dmg directly from the GitHub release page.
class MytoolsOsint < Formula
  desc "Bluetm OSINT CLI — 32 free-source modules, red-team profiles, TUI, web dashboard, HTML reports"
  homepage "https://github.com/Azizbek16l/mytools-osint"
  version "0.3.1"
  license "MIT"

  # Note: only macOS arm64 binary ships in v0.3.1. macOS Intel + Linux users:
  #   `pipx install mytools-osint==0.3.1`
  # Linux binary will land once the release CI workflow `shasum` fix ships
  # (blocked on a workflow-scope token refresh).
  on_macos do
    on_arm do
      url "https://github.com/Azizbek16l/mytools-osint/releases/download/v#{version}/osint-macos-arm64"
      sha256 "94b1711e17fa17d651f4f1ded10a7d1ca65ad65ce0169a662a1cc6247c8da348"
    end
  end

  def install
    bin.install Dir["osint-*"].first => "osint"
  end

  test do
    assert_match "mytools-osint", shell_output("#{bin}/osint --version")
  end
end
