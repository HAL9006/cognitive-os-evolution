# ONE PAGE / 迷ったらここだけ
- まずこれだけ：`.\tools\coe.ps1` をダブルクリック or `pwsh -File .\tools\coe.ps1`
- やりたいことを選ぶ → 自動でコマンド実行＆次の一手を表示
- SSOTは `docs/jarvis_skillboard.md`。ここだけ編集してOK
# 1) ONE-PAGE にマニュアル追記
@'
# Cognitive OS: ADHDフレンドリー自動セットアップ & Explainer AI最小キット

## 概要
このプロジェクトは、設定作業やツール操作が苦手な人でも迷わず進められるように設計された、
**ADHDフレンドリーな自動セットアップ環境**です。  
「SSOT（Single Source of Truth）」を唯一の情報源として固定し、その他の作業は自動化・ガイド化します。

---

## 特徴
- **SSOT固定**：`docs/jarvis_skillboard.md` が唯一の情報源
- **自動セットアップ**：初期フォルダ、テンプレ、GitHub Actionsを一括生成
- **メニュー式ガイド**：`tools/coe.ps1` で操作をメニュー化
- **ワンクリック取説**：`docs/ONE-PAGE.md` に最低限の手順を記載
- **Help Issue支援**：困ったらGitHubのIssueから即サポートフローへ

---

## 主なファイル構成
| ファイル/フォルダ | 役割 |
|------------------|------|
| `docs/jarvis_skillboard.md` | **SSOT本体**。全仕様やスキルはここだけ編集 |
| `docs/ONE-PAGE.md` | 一枚説明書。迷ったらこれを見る |
| `tools/coe.ps1` | メニュー式案内スクリプト（Git操作と次の一手提示） |
| `.github/ISSUE_TEMPLATE/help.yml` | 「Help」Issueテンプレート |
| `.github/workflows/ssot-auto-evolution.yml` | SSOT変更検出用のGitHub Actions |
| `.github/workflows/nudge.yml` | Push/Help Issue時の自動ガイド |

---

## 超短縮の使い方
1. `pwsh -File .\tools\coe.ps1` を実行
2. メニューからやりたいことを選択  
　例: **1)** SSOTを開く → **2)** GitHubへ反映
3. GitHub Actionsの結果を確認（緑＝成功）

---

## ヘルプのもらい方
- GitHubで `Help` Issue を作成
- 現状やエラー画面を貼り付け
- 自動コメントで「次の一手」が提示される

---

## 設計思想
- **覚えなくていい**：操作は全部 `coe.ps1` が案内
- **安心して戻せる**：全履歴はGitに保存
- **迷ったら1枚**：ONE-PAGE.mdを見れば次の行動が分かる

---
✅ **編集するのは `docs/jarvis_skillboard.md` だけ！**
'@ | Add-Content -Encoding UTF8 .\docs\ONE-PAGE.md

# 2) Git に反映
git add .\docs\ONE-PAGE.md
git commit -m "docs: add ADHD-friendly setup & Explainer AI quick manual to ONE-PAGE"
git push origin main
