#!/bin/zsh
# 더블클릭하면 크롬 키오스크(전체화면)로 포트폴리오 월을 실행합니다. 종료: Cmd+Q
cd "$(dirname "$0")"
open -na "Google Chrome" --args --kiosk --user-data-dir="/tmp/portfolio-wall" \
  --autoplay-policy=no-user-gesture-required --allow-file-access-from-files \
  --noerrdialogs --disable-session-crashed-bubble "file://$PWD/index.html"
