#!/usr/bin/env bash
# 发布脚本：把最新改动推到 GitHub Pages（固定地址 https://huh76.github.io/print-calc/）
# 用法: bash publish.sh <github_pat>
# token 仅通过参数传入，不写入任何文件。
set -e
TOKEN="$1"
if [ -z "$TOKEN" ]; then
  echo "用法: bash publish.sh <github_pat>"
  exit 1
fi
cd "$(dirname "$0")"
git add -A
git commit -m "update: $(date '+%Y-%m-%d %H:%M')" >/dev/null 2>&1 || true
git push "https://$TOKEN@github.com/Huh76/print-calc.git" main
echo "已推送，GitHub Pages 自动重建 -> https://huh76.github.io/print-calc/"
