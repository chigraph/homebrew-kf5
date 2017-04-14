require "formula"

class Kf5Kdbusaddons < Formula
  url "http://download.kde.org/stable/frameworks/5.32/kdbusaddons-5.32.0.tar.xz"
  sha256 "099872dc19e917ca7b172881ca547b4df7f62e1968fab805a540fd99b59425a8"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kdbusaddons.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "shared-mime-info"
  depends_on "d-bus"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "af70b7fd6c3ab52a625105fbee1ffdf4279954d1c0044042bea04d70896e77a8" => :sierra
  end

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
