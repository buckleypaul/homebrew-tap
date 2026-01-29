class Mdglow < Formula
  include Language::Python::Virtualenv

  desc "Convert markdown files to beautifully styled PDFs"
  homepage "https://github.com/buckleypaul/mdglow"
  url "https://github.com/buckleypaul/mdglow/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c98f3774ece7919e7d508edfd746f09b5ef696a3256eb9536a77cb8808f51043"
  license "MIT"

  depends_on "python@3.12"
  depends_on "pango"
  depends_on "cairo"

  resource "typer" do
    url "https://files.pythonhosted.org/packages/76/42/3efaf858001d2c2913de7f354563e3a3a2f0decae3efe98427125a8f441e/typer-0.15.1.tar.gz"
    sha256 "a0588c0a7fa68a1978a069818657778f86abe6ff5ea6abf472f940a08bfe4f0a"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/cd/0f/62ca20172d4f87d93cf89665fbaedcd560ac48b465bd1d92bfc7ea6b0a41/click-8.1.8.tar.gz"
    sha256 "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
  end

  resource "shellingham" do
    url "https://files.pythonhosted.org/packages/58/15/8b3609fd3571ef9a36575e7aa0a7be93c1db7dcef61589e0af8d3b7c3a93/shellingham-1.5.4.tar.gz"
    sha256 "8dbca0739d487e5bd35ab3ca4b36e11c4078f3a234bfce294b0a0291363404de"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/ab/3a/0316b28d0761c6734d6bc14e770d85506c986c85ffb239e688eebd9b0571/rich-13.9.4.tar.gz"
    sha256 "439594978a49a09530cff7ebc4b5c7103ef57c5a1b8065a7bc0f02e91aa3bfb9"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/38/71/3b932df36c1a044d397a1f92d1cf91ee0a503d91e470cbd670aa66b07ed0/markdown-it-py-3.0.0.tar.gz"
    sha256 "e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3afafbd6c1e1e0d3e0e8e3e6a1d3b4f8fd4/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/7c/2d/c3338d48ea6cc0feb8446d8e6937e1408088a72a39937982cc6111d17f84/pygments-2.19.1.tar.gz"
    sha256 "61c16d2a8576dc0649d9f39e089b5f02bcd27fba10d8fb4dcc28173f7a45151f"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/df/db/f35a00659bc03fec321ba8bce9420de607a1d37f8342eee1863174c69557/typing_extensions-4.12.2.tar.gz"
    sha256 "1a7ead55c7e559dd4dee8856e3a88b41225abfe1ce8df57b7c13915fe121ffb8"
  end

  resource "weasyprint" do
    url "https://files.pythonhosted.org/packages/86/bb/4f7fd4e53fef2f31cca3a3acc0e7da54cee2bd6d48fc7d797a3ae85e6d18/weasyprint-63.1.tar.gz"
    sha256 "3ea5d8f06dd3591f6d3eb2fbe7de4fcb30d608e65b97a3234b2275454323c83a"
  end

  resource "pydyf" do
    url "https://files.pythonhosted.org/packages/ff/4b/b03c50bda89090e3ca0a9f8c88b0ad21ecff6d51df0cfd34fd22d5cff2da/pydyf-0.11.0.tar.gz"
    sha256 "394dddf619cca9d0c55715e3c55ea121a9bf9cbc780cdc1201a2427917b86b64"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/fc/97/c783634659c2920c3fc70419e3af40972dbaf758daa229a7d6ea6135c90d/cffi-1.17.1.tar.gz"
    sha256 "1c39c6016c32bc48dd54561950ebd6836e1670f2ae46128f67cf49e789c52824"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/1d/b2/31537cf4b1ca988837256c910a668b553fceb8f069bedc4b1c826024b52c/pycparser-2.22.tar.gz"
    sha256 "491c8be9c040f5390f5bf44a5b07752bd07f56edf992381b05c701439eec10f6"
  end

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/a5/26/0d95c04c868f6bdb0c447e3ee2de5564411845e36a858cfd63766bc7b563/pillow-11.0.0.tar.gz"
    sha256 "72bacbaf24ac003fea9bff9837d1eedb6088758d41e100c1552930151f677739"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/d7/4e/053fe1b5c0ce346c0a9d0557492c654362bafb14f026eae0d3ee98009152/fonttools-4.55.3.tar.gz"
    sha256 "636a5ac0e399b7938a3d49576b50c4ec31dfdcd7c93726c104a8830b4d1d88e5"
  end

  resource "cssselect2" do
    url "https://files.pythonhosted.org/packages/e7/fc/326cb6f988905998f09bb54a3f5d98d4462ba119363c0dfad29750d48c09/cssselect2-0.7.0.tar.gz"
    sha256 "1ccd984dab89fc68955043aca4e1b03e0cf29cad9880f6e28e3ba7a74b14aa5a"
  end

  resource "tinycss2" do
    url "https://files.pythonhosted.org/packages/44/6f/38d2335a2b70b9982d112bb177e3dbe169746423e33f718bf5e9c7b3ddd3/tinycss2-1.4.0.tar.gz"
    sha256 "10c0972f6fc0fbee87c3edb76549357c8e18177d68898cacd9ba93a712fb4d97"
  end

  resource "webencodings" do
    url "https://files.pythonhosted.org/packages/0b/02/ae6ceac1baeda530866a85075641cec12989bd8d31af6d5ab4a3e8c92f47/webencodings-0.5.1.tar.gz"
    sha256 "b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923"
  end

  resource "pyphen" do
    url "https://files.pythonhosted.org/packages/4b/c4/8b3d4e0c8a59d38e4d48c249bc85dc5210fcacafe9d5d1a0b435701b3f30/pyphen-0.16.0.tar.gz"
    sha256 "2c006b3ddf072c9571ab97606d9ab3c26a92eaced4c0d59fd1d26988faa84be8"
  end

  resource "tinyhtml5" do
    url "https://files.pythonhosted.org/packages/7c/4f/98a495caadb0ed4b5e7f2afe3059bacc12e5e5386e4af8c67bb8be86a0e1/tinyhtml5-2.0.0.tar.gz"
    sha256 "086bafa5ed34556298750ad839904b97c078464d8168a450049e71f6df523856"
  end

  resource "markdown" do
    url "https://files.pythonhosted.org/packages/54/28/3af612670f82f4c056911fbbbb42760255801b3068c48de792d354ff4472/markdown-3.7.tar.gz"
    sha256 "2ae2471477cfd02dbbf038d5d9bc226d40def84b4fe2986e49b59b6b472bbed2"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    (testpath/"test.md").write("# Hello\nWorld")
    system bin/"mdglow", "test.md"
    assert_predicate testpath/"test.pdf", :exist?
  end
end
