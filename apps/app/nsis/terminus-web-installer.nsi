Unicode true
!include "MUI2.nsh"
!include "LogicLib.nsh"

Name "终末启动器 在线安装"
OutFile "D:\devtools\webinstaller-out\TerminusWebSetup.exe"
RequestExecutionLevel user
ShowInstDetails show

; 唯一的下载源。发布新版本只改这一行。
!define DL_URL "https://github.com/666470/ZhongMoQiDongQi/releases/download/v1.9.7/TerminusLauncher_1.9.7_x64-setup.exe"
!define REL_PAGE "https://github.com/666470/ZhongMoQiDongQi/releases/latest"

Var TargetFile
Var ExitCode

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_LANGUAGE "SimpChinese"

Section "下载并安装"
  StrCpy $TargetFile "$TEMP\TerminusLauncher-setup.exe"
  DetailPrint "下载地址：${DL_URL}"
  DetailPrint "正在下载安装包（约 64 MB），请稍候…"
  ; Windows 10 1803+ 自带 curl.exe，先走它；老系统回落到 PowerShell。
  nsExec::ExecToLog '"$SYSDIR\curl.exe" -L --fail --retry 3 --connect-timeout 20 -o "$TargetFile" "${DL_URL}"'
  Pop $ExitCode
  StrCmp $ExitCode "0" download_ok
    DetailPrint "curl 失败（$ExitCode），改用 PowerShell 重试…"
    nsExec::ExecToLog 'powershell -NoProfile -ExecutionPolicy Bypass -Command "$$ProgressPreference=0; Invoke-WebRequest -Uri '${DL_URL}' -OutFile '$TargetFile' -UseBasicParsing"'
    Pop $ExitCode
  download_ok:
  ${If} $ExitCode != 0
    MessageBox MB_ICONSTOP|MB_YESNO "下载失败（代码 $ExitCode）。$\r$\n$\r$\n常见原因：网络到 GitHub 不稳定。$\r$\n$\r$\n点“是”打开发布页手动下载，点“否”退出。" IDYES open_page
    Abort "下载失败"
  ${EndIf}
  ${IfNot} ${FileExists} "$TargetFile"
    MessageBox MB_ICONSTOP|MB_YESNO "没有拿到安装包。$\r$\n$\r$\n点“是”打开发布页手动下载，点“否”退出。" IDYES open_page
    Abort "下载失败"
  ${EndIf}
  Goto run_setup
  open_page:
    ExecShell "open" "${REL_PAGE}"
    Abort "已打开发布页"
  run_setup:
  DetailPrint "下载完成，正在启动安装程序…"
  ExecWait '"$TargetFile"' $0
  DetailPrint "安装程序结束，返回码 $0"
  Delete "$TargetFile"
SectionEnd

