cask "sniptext" do
  version "1.0"
  sha256 "b3650a1befd7e8a479cf4ec8fc8456b16d7eb70c19e765d7f4836c4c6432afcd"
  url "https://github.com/khduy/SnipText/releases/download/v1.0/SnipText.zip"
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
