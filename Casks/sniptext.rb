cask "sniptext" do
  version "1.0"
  sha256 "d2ffe7c803c436868e794d3c30065957dcbb4ca2187b688aa16ae864f28e2b7f"

  url "https://github.com/khduy/SnipText/releases/download/v#{version}/SnipText-#{version}.zip"
  name "SnipText"
  desc "Capture screen regions and copy extracted text"
  homepage "https://github.com/khduy/SnipText"

  depends_on arch: :arm64

  app "SnipText.app"

  zap trash: [
    "~/Library/Application Support/SnipText",
    "~/Library/Preferences/com.khduy.SnipText.plist",
  ]

  caveats <<~EOS
    SnipText is currently unsigned.
    If macOS blocks it on first launch, run:

      xattr -cr /Applications/SnipText.app
  EOS
end
