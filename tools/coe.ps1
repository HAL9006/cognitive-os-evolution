Param([string]$Action="menu")
function Write-Next($t){ Write-Host "`n➡ 次の一手：" -NoNewline; Write-Host $t -ForegroundColor Cyan }
function Git-Push(){ git add -A; git commit -m "chore: update via coe" 2>$null; git push origin main }
switch ($Action) {
  "menu" {
    Clear-Host
    Write-Host "Cognitive OS Explainer (coe)"; Write-Host "=============================="
    Write-Host "1) SSOT( docs/jarvis_skillboard.md ) を開く"
    Write-Host "2) 変更をGitHubへ反映（add/commit/push）"
    Write-Host "3) いまの状態を要約"
    Write-Host "4) 困った…（復旧とよくある対処）"
    $k = Read-Host "番号を入力"
    if($k -eq "1"){ if(Test-Path docs/jarvis_skillboard.md){ start docs/jarvis_skillboard.md } else { "# Jarvis Skillboard v1.2 (LOCKED)`n" | Set-Content -Encoding UTF8 docs/jarvis_skillboard.md; start docs/jarvis_skillboard.md } ; Write-Next "書いたら 2) を実行" }
    elseif($k -eq "2"){ Git-Push; Write-Next "GitHub の Actions → `SSOT Auto Evolution (Minimal)` が緑になるか確認" }
    elseif($k -eq "3"){ git status; Write-Next "変更多ければ 2) を実行" }
    else {
      Write-Host "`n【復旧】" -ForegroundColor Yellow
      Write-Host "A) pushでエラー: `git branch -M main; git push -u origin main`"
      Write-Host "B) 何も起きない: docs/jarvis_skillboard.md を1行編集→保存→coe 2)"
      Write-Next "分からなければ Issues で 'Help' を作成（テンプレあり）"
    }
  }
  default { Write-Host "使い方: pwsh -File .\tools\coe.ps1" }
}
