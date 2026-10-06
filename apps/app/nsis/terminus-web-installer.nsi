Unicode true
Name "终末启动器 在线安装程序"
OutFile "D:\devtools\webinstaller-out\TerminusWebSetup.exe"
InstallDir "$TEMP\TerminusWebSetup"
RequestExecutionLevel user
ShowInstDetails show

; 唯一的下载源（走国内可用的 GitHub 加速通道，直连 github.com 在部分网络下不通）。
; 发布新版本只改这一行。
!define DL_URL "https://gh-proxy.com/https://github.com/666470/ZhongMoQiDongQi/releases/download/v1.9.11/TerminusLauncher_1.9.11_x64-setup.exe"
!define REL_PAGE "https://github.com/666470/ZhongMoQiDongQi/releases/latest"

Var TargetFile

Function .onInit
  InitPluginsDir
  StrCpy $TargetFile "$PLUGINSDIR\TerminusLauncherSetup.exe"
FunctionEnd

Page instfiles

Section "下载并安装" SEC_MAIN
  DetailPrint "正在从国内加速通道下载安装包，请稍候..."
  nsExec::ExecToLog '"$SYSDIR\curl.exe" -L --fail --retry 3 --connect-timeout 20 -o "$TargetFile" "${DL_URL}"'
  Pop $0
  IfFileExists "$TargetFile" 0 failed
  DetailPrint "下载完成，正在启动安装程序..."
  ExecWait "$TargetFile"
  Goto done

  failed:
  MessageBox MB_YESNO|MB_ICONEXCLAMATION "下载失败（网络不通或加速通道暂不可用）。$\r$\n是否打开发布页手动下载？" IDNO done
  ExecShell "open" "${REL_PAGE}"

  done:
SectionEnd
