#!/usr/bin/env bash
# DCS Harness v2.18 — 安装到 dsh profile，窗口自动可用，无需独立页面。
#
# 用法：
#   bash scripts/install-harness-profile.sh                 # 装到 web profile（dsh web）
#   bash scripts/install-harness-profile.sh desktop         # 装到 desktop profile
#   DSH_PROFILE=web bash scripts/install-harness-profile.sh # 环境变量方式
#
# 前置：
#   dsh >= 0.2.0-rc.2。本插件 peer 精确钉在 @deepseek-ai/dsh-tools 0.2.0-rc.2；
#   dsh 0.2.0 起有插件版本门，peer 不匹配会直接拒绝安装并回滚。
#   注意：桌面应用（DeepSeek Harness.app）的 desktop profile 由应用独占管理，
#   CLI 会报 `profile "desktop" is managed exclusively by the Electron application`，
#   桌面版请在「设置 → 插件」里安装。
#
# 安装后：
#   重启 dsh（或按 dsh 的插件热载提示操作）→ 对话上方自动出现
#   「项目管理 / 项目文件 / 结果交付」窗口 +「DCS Cloud」设置页，
#   无需独立 profile / 启动器按钮。
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DSH_PROFILE="${1:-${DSH_PROFILE:-web}}"

echo "==> 安装 dsh-dcs-cloud 到 dsh profile: ${DSH_PROFILE}"
dsh plugin --profile "$DSH_PROFILE" add "$REPO_DIR"

echo ""
echo "✅ DCS Harness 已安装到 dsh profile「${DSH_PROFILE}」。"
echo "   重启 dsh 后，「项目管理 / 项目文件 / 结果交付」窗口自动出现在对话上方，"
echo "   设置 → DCS Cloud 配置 PAT 即可开始使用；无需再启动独立页面。"
