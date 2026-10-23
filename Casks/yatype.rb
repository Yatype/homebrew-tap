cask "yatype" do
  version "0.1.0"
  sha256 "93261a23357eab3b1a6d2f61193cab1434df6a73788ba475211115b915e98675"

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
