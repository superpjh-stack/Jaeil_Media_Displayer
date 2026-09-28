#!/bin/zsh
# 사이트 화면을 다시 캡처해 assets/shots 를 갱신합니다. (전시 전날 1회 실행 권장)
cd "$(dirname "$0")"
CH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
URLS=(http://187.52.127.215:8600/ https://jaeil-project-manager.vercel.app/ http://srv1934103.hstgr.cloud:8025/edge http://187.52.127.215:8013/ http://187.52.127.215:8022/)
i=1
for u in $URLS; do
  "$CH" --headless=new --disable-gpu --hide-scrollbars --window-size=1920,1080 --virtual-time-budget=10000 --screenshot="$PWD/assets/shots/0$i-fold.png" "$u" >/dev/null 2>&1
  "$CH" --headless=new --disable-gpu --hide-scrollbars --window-size=1920,3240 --virtual-time-budget=10000 --screenshot="$PWD/assets/shots/0$i-tall.png" "$u" >/dev/null 2>&1
  echo "캡처 완료 $i: $u"; i=$((i+1))
done
echo "참고: 긴(tall) 캡처 하단 빈 여백은 자동으로 잘리지 않습니다."
