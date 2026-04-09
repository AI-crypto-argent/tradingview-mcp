#!/bin/bash
# TradingView Desktop を CDP デバッグポート付きで起動
# Usage: bash launch_tv.sh

PORT=9222

# 既に起動中か確認
if curl -s "http://localhost:${PORT}/json/version" > /dev/null 2>&1; then
    echo "TradingView は既にポート ${PORT} で起動中です"
    curl -s "http://localhost:${PORT}/json/version" | python3 -m json.tool
    exit 0
fi

echo "TradingView を --remote-debugging-port=${PORT} で起動します..."
/Applications/TradingView.app/Contents/MacOS/TradingView --remote-debugging-port=${PORT} &
disown

echo "起動完了。数秒後に接続可能になります。"
echo "確認: curl http://localhost:${PORT}/json/version"
