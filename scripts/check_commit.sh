#!/usr/bin/env bash
set -euo pipefail

# Conventional Commits 檢查腳本（純 shell，不需依賴任何語言環境）
# 對應環境變數由 workflow 傳入：
#   GITHUB_EVENT_NAME / GITHUB_HEAD_REF / GITHUB_BASE_REF

EVENT_NAME="${GITHUB_EVENT_NAME:-}"
HEAD_REF="${GITHUB_HEAD_REF:-}"
BASE_REF="${GITHUB_BASE_REF:-}"

if [ "$EVENT_NAME" = "pull_request" ] && [ -n "$HEAD_REF" ]; then
  if [ -n "$BASE_REF" ]; then
    REF_RANGE="origin/${BASE_REF}..origin/${HEAD_REF}"
  else
    REF_RANGE="origin/${HEAD_REF}"
  fi
  COMMITS="$(git log --pretty=format:%s "$REF_RANGE")"
else
  COMMITS="$(git log --pretty=format:%s -1 HEAD)"
fi

PATTERN='^(feat|fix|docs|style|refactor|test|chore|ci|release)(\([a-z0-9_/.-]+\))?: [a-zA-Z].+'

FAILED=0
while read -r commit; do
  # 不設 IFS，read 會自動去除前後空白
  [ -z "$commit" ] && continue

  # 不檢查 merge commit（遇到即停止）
  case "$commit" in
    Merge*) break ;;
  esac

  if ! printf '%s' "$commit" | grep -Eq "$PATTERN"; then
    echo "❌ Invalid commit: $commit"
    FAILED=1
  fi
done <<EOF
$COMMITS
EOF

if [ "$FAILED" -ne 0 ]; then
  echo "❌ Commit lint failed. Please follow Conventional Commits format: type(scope): subject"
  exit 1
fi

echo "✅ All commits passed commit lint."
