cask "yatype" do
  version "0.1.1"
  sha256 "5ff240aaef23472daca0185052fb86dc0c39a4cdc1bd0c9994ce0282683456d6"

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
