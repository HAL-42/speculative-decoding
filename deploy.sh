#!/usr/bin/env bash
# 发布已有仓库的 main 分支到 GitHub Pages。
set -euo pipefail
cd "$(dirname "$0")"
gh auth status -h github.com >/dev/null
if [ "$(git branch --show-current)" != "main" ]; then
  echo "请切换到 main 分支后再发布。" >&2
  exit 1
fi
if ! git diff --cached --quiet; then
  echo "已有暂存修改，请先检查并处理，再运行发布脚本。" >&2
  exit 1
fi
git add index.html README.md .nojekyll deploy.sh
if ! git diff --cached --quiet; then
  git commit -m "[Web]: ✨ 更新投机采样交互式学习网页"
fi
git push origin main
echo "已推送，GitHub Pages 将自动构建。"
gh api repos/HAL-42/speculative-decoding/pages --jq .html_url
