require "formula"

class Kf5Ktexteditor < Formula
  url "http://download.kde.org/stable/frameworks/5.32/ktexteditor-5.32.0.tar.xz"
  sha256 "fc4951138802455f5df773a918d725162febcf0e650d888b66d50c3726e2cbeb"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/ktexteditor.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "haraldf/kf5/kf5-kparts"
  depends_on "haraldf/kf5/kf5-syntax-highlighting"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "9c23e4c0c6d1b368d14791b0158e0852608bcd87afd468f920fe52cc627b5d2e" => :sierra
  end

  def install
    ln_sf Dir["#{HOMEBREW_PREFIX}/share/kservicetypes5"], "#{Etc.getpwuid.dir}/Library/Application Support/"
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
