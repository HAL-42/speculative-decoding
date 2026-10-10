#!/usr/bin/env bash
# 把本目录发布到 GitHub Pages：bash deploy.sh [仓库名]
set -euo pipefail
cd "$(dirname "$0")"
REPO="${1:-speculative-decoding}"

if ! gh auth status -h github.com >/dev/null 2>&1; then
  echo "gh 未登录或 token 失效，开始重新登录……"
  gh auth login -h github.com -w
fi
OWNER="$(gh api user -q .login)"

[ -d .git ] || git init -q -b main
git add index.html README.md .nojekyll deploy.sh
if ! git diff --cached --quiet; then
  git commit -q -m "Add interactive explainer on speculative decoding

Co-Authored-By: Claude <noreply@anthropic.com>"
fi

if gh repo view "$OWNER/$REPO" >/dev/null 2>&1; then
  git remote get-url origin >/dev/null 2>&1 || git remote add origin "https://github.com/$OWNER/$REPO.git"
  git push -u origin main
else
  gh repo create "$REPO" --public --source=. --remote=origin --push \
    --description "投机采样（Speculative Decoding）可视化交互讲解"
fi

# 开启 Pages（已开启时该请求会失败，忽略即可）
gh api -X POST "repos/$OWNER/$REPO/pages" -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1 || true

echo
echo "仓库：https://github.com/$OWNER/$REPO"
echo "页面：https://$OWNER.github.io/$REPO/  （首次构建约需 1 分钟）"
