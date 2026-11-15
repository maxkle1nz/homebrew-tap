class Agy < Formula
  include Language::Python::Shebang

  desc "Command-line bridge to Google Antigravity agents and the Gemini API"
  homepage "https://github.com/maxkle1nz/wingman-agy"
  url "https://github.com/maxkle1nz/wingman-agy/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "2e0518be4c4932ad55628fd59ba1053f4aeccea5c4a47dad1510989e799a8391"
  license "MIT"

  depends_on :macos
  depends_on "python@3.13"

  def install
    libexec.install "agy", "plugin", "skills"
    rewrite_shebang detected_python_shebang, libexec/"agy"
    bin.install_symlink libexec/"agy"
  end

  def caveats
    <<~EOS
      To install the wingman plugin, store a Gemini API key and teach your agents
      (Claude Code, Codex, Antigravity), run this yourself in a terminal:
        agy setup --apply
      Then check everything with:
        agy doctor
    EOS
  end

  test do
    assert_match "agy #{version}", shell_output("#{bin}/agy --version")
  end
end
