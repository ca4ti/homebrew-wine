class Winetricks < Formula
  desc "Automatic workarounds for problems in Wine"
  homepage "https://github.com/Winetricks/winetricks"
  url "https://github.com/The-Wineskin-Project/winetricks/archive/20221022.tar.gz"
  sha256 "ee2e2fc125248433294456376ddffb20b1722b80728c6b329df6a0c1521e5661"
  license "LGPL-2.1-or-later"
  head "https://github.com/The-Wineskin-Project/winetricks.git", branch: "macOS"

  livecheck do
    url :stable
    regex(/^v?(\d{6,8})$/i)
  end

  bottle do
    root_url "https://github.com/Gcenx/homebrew-wine/releases/download/winetricks-20221022"
    sha256 cellar: :any_skip_relocation, big_sur: "69b0b05ed069ce4760ca1f0b34ec42bebb72684853bf2bbfb0fc5cd6e0948308"
  end

  depends_on "cabextract"
  depends_on "p7zip"
  depends_on "unzip"

  def install
    bin.install "src/winetricks"
    man1.install "src/winetricks.1"
  end

  test do
    system "#{bin}/winetricks", "--version"
  end
end
