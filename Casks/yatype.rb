cask "yatype" do
  version "0.1.2"
  sha256 "f6836e92771b7115205c29c64a71775750a6c062951052d84a471fb42fc7ebff"

  url "https://github.com/Yatype/yatype/releases/download/v#{version}/Yatype-#{version}.dmg"
  name "Yatype"
  desc "Fixes text typed in the wrong keyboard layout (Russian/English)"
  homepage "https://github.com/Yatype/yatype"

  app "Yatype.app"

  # Программа бесплатная и без подписи Apple: снимаем карантин, чтобы
  # macOS не показывала предупреждение «не удаётся проверить разработчика».
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Yatype.app"]
  end

  uninstall quit: "com.yatype.app"

  zap trash: "~/Library/Preferences/com.yatype.app.plist"
end
