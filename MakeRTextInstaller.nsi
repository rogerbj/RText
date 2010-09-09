; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "RText"
!define PRODUCT_VERSION "1.2.0"
!define PRODUCT_WEB_SITE "http://fifesoft.com/rtext/"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\RText.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "extra\License.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\RText.exe"
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\Readme.txt"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "rtext_${PRODUCT_VERSION}_win32_setup.exe"
InstallDir "$PROGRAMFILES\RText"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "MainSection" SEC01
  WriteRegStr HKLM "Software\RText" "Location" "$INSTDIR"
  SetOutPath "$INSTDIR"
  SetOverwrite on
  File "RText.exe"
  CreateDirectory "$SMPROGRAMS\RText"
  CreateShortCut "$SMPROGRAMS\RText\RText.lnk" "$INSTDIR\RText.exe"
  CreateShortCut "$DESKTOP\RText.lnk" "$INSTDIR\RText.exe"
  SetOverwrite on
  SetOutPath "$INSTDIR\doc\en"
  File "dist\doc\en\aboutdialogimage.jpg"
  File "dist\doc\en\AllEditOptions.html"
  File "dist\doc\en\Background.html"
  File "dist\doc\en\BugList.html"
  File "dist\doc\en\Changes.txt"
  File "dist\doc\en\Close.html"
  File "dist\doc\en\CloseAll.html"
  File "dist\doc\en\Copy.html"
  File "dist\doc\en\Cut.html"
  File "dist\doc\en\DecreaseIndent.html"
  File "dist\doc\en\DefiningFileFilters.html"
  File "dist\doc\en\DefiningShortcuts.html"
  File "dist\doc\en\Delete.html"
  File "dist\doc\en\DeleteToLineEnd.html"
  File "dist\doc\en\Developers.html"
  File "dist\doc\en\EditMenu.html"
  File "dist\doc\en\FAQ.html"
  File "dist\doc\en\FileChooser.html"
  File "dist\doc\en\FileMenu.html"
  File "dist\doc\en\Find.html"
  File "dist\doc\en\FindNext.html"
  File "dist\doc\en\FormatMenu.html"
  File "dist\doc\en\GoTo.html"
  File "dist\doc\en\HelpMenu.html"
  File "dist\doc\en\IncreaseIndent.html"
  File "dist\doc\en\InsertOverwriteModes.html"
  File "dist\doc\en\Introduction.html"
  File "dist\doc\en\JoinLines.html"
  File "dist\doc\en\License.txt"
  File "dist\doc\en\LineNumbers.html"
  File "dist\doc\en\LookAndFeel.html"
  File "dist\doc\en\Macros.html"
  File "dist\doc\en\MacrosMenu.html"
  File "dist\doc\en\MacrosPlayback.html"
  File "dist\doc\en\MacrosRecording.html"
  File "dist\doc\en\MacrosRecordingTemporary.html"
  File "dist\doc\en\MacrosStopRecording.html"
  File "dist\doc\en\MenuBar.html"
  File "dist\doc\en\New.html"
  File "dist\doc\en\Open.html"
  File "dist\doc\en\OpenInNewWindow.html"
  File "dist\doc\en\OptionsDialog.html"
  File "dist\doc\en\OptionsFileChooser.html"
  File "dist\doc\en\OptionsFileFilters.html"
  File "dist\doc\en\OptionsGeneral.html"
  File "dist\doc\en\OptionsLanguage.html"
  File "dist\doc\en\OptionsMacros.html"
  File "dist\doc\en\OptionsPrinting.html"
  File "dist\doc\en\OptionsShortcuts.html"
  File "dist\doc\en\OptionsSourceBrowser.html"
  File "dist\doc\en\OptionsSyntaxHighlighting.html"
  File "dist\doc\en\OptionsTemplates.html"
  File "dist\doc\en\OptionsTextArea.html"
  File "dist\doc\en\OptionsUserInterface.html"
  File "dist\doc\en\Paste.html"
  File "dist\doc\en\Print.html"
  File "dist\doc\en\PrintPreview.html"
  File "dist\doc\en\QuickSearchBar.html"
  File "dist\doc\en\Redo.html"
  File "dist\doc\en\Replace.html"
  File "dist\doc\en\ReplaceAll.html"
  File "dist\doc\en\ReplaceNext.html"
  File "dist\doc\en\RText.html"
  File "dist\doc\en\RTextHelpDialog.properties"
  File "dist\doc\en\RTextHelpDialog_es.properties"
  File "dist\doc\en\Save.html"
  File "dist\doc\en\SaveAll.html"
  File "dist\doc\en\SaveAs.html"
  File "dist\doc\en\SaveAsWebPage.html"
  File "dist\doc\en\SelectAll.html"
  File "dist\doc\en\SourceBrowser.html"
  File "dist\doc\en\StatusBar.html"
  File "dist\doc\en\SyntaxHighlighting.html"
  File "dist\doc\en\Templates.html"
  File "dist\doc\en\TimeDate.html"
  File "dist\doc\en\Toolbar.html"
  File "dist\doc\en\Undo.html"
  File "dist\doc\en\UsingCustomIconSets.html"
  File "dist\doc\en\UsingRegularExpressions.html"
  File "dist\doc\en\ViewMenu.html"
  File "dist\doc\en\WindowMenu.html"
  File "dist\doc\en\WordWrap.html"
  SetOutPath "$INSTDIR\doc"
  File "dist\doc\HelpDialogContents.xml"
  SetOutPath "$INSTDIR\icongroups"
  File "dist\icongroups\BlueSphereIcons.jar"
  File "dist\icongroups\EclipseIcons.jar"
  File "dist\icongroups\ExtraIcons.xml"
  File "dist\icongroups\JavaIcons.jar"
  File "dist\icongroups\XPIcons.jar"
  SetOutPath "$INSTDIR\lnfs"
  File "dist\lnfs\lookandfeels.xml"
  File "dist\lnfs\OfficeLnFs.jar"
  File "dist\lnfs\OfficeLnFs.License.txt"
  SetOutPath "$INSTDIR\plugins"
  File "dist\plugins\FileSystemTree.jar"
  File "dist\plugins\HeapIndicator.jar"
  File "dist\plugins\SourceBrowser.jar"
  File "dist\plugins\TaskList.jar"
  File "dist\plugins\ToolSupport.jar"
  SetOutPath "$INSTDIR"
  File "dist\autocomplete.jar"
  File "dist\rsta_spellchecker.jar"
  File "dist\english_dic.zip"
  File "dist\ExtraFileChooserFilters.xml"
  File "dist\fife.common.jar"
  File "dist\License.txt"
  File "dist\localizations.xml"
  File "dist\Readme.txt"
  File "dist\readme.unix"
  File "dist\rsyntaxtextarea.jar"
  File "dist\RSyntaxTextArea.License.txt"
  File "dist\RText.jar"
  File "dist\Win32FileIOExtras.dll"
  File "dist\x64FileIOExtras.dll"
SectionEnd

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\RText\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\RText\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\RText.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\RText.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\x64FileIOExtras.dll"
  Delete "$INSTDIR\Win32FileIOExtras.dll"
  Delete "$INSTDIR\RText.jar"
  Delete "$INSTDIR\RSyntaxTextArea.License.txt"
  Delete "$INSTDIR\rsyntaxtextarea.jar"
  Delete "$INSTDIR\readme.unix"
  Delete "$INSTDIR\Readme.txt"
  Delete "$INSTDIR\localizations.xml"
  Delete "$INSTDIR\License.txt"
  Delete "$INSTDIR\fife.common.jar"
  Delete "$INSTDIR\ExtraFileChooserFilters.xml"
  Delete "$INSTDIR\english_dic.zip"
  Delete "$INSTDIR\rsta_spellchecker.jar"
  Delete "$INSTDIR\autocomplete.jar"
  Delete "$INSTDIR\plugins\ToolSupport.jar"
  Delete "$INSTDIR\plugins\TaskList.jar"
  Delete "$INSTDIR\plugins\SourceBrowser.jar"
  Delete "$INSTDIR\plugins\RTextL10nGen.jar"
  Delete "$INSTDIR\plugins\HeapIndicator.jar"
  Delete "$INSTDIR\plugins\FileSystemTree.jar"
  Delete "$INSTDIR\lnfs\OfficeLnFs.License.txt"
  Delete "$INSTDIR\lnfs\OfficeLnFs.jar"
  Delete "$INSTDIR\lnfs\lookandfeels.xml"
  Delete "$INSTDIR\icongroups\XPIcons.jar"
  Delete "$INSTDIR\icongroups\JavaIcons.jar"
  Delete "$INSTDIR\icongroups\ExtraIcons.xml"
  Delete "$INSTDIR\icongroups\EclipseIcons.jar"
  Delete "$INSTDIR\icongroups\BlueSphereIcons.jar"
  Delete "$INSTDIR\doc\HelpDialogContents.xml"
  Delete "$INSTDIR\doc\en\WordWrap.html"
  Delete "$INSTDIR\doc\en\WindowMenu.html"
  Delete "$INSTDIR\doc\en\ViewMenu.html"
  Delete "$INSTDIR\doc\en\UsingRegularExpressions.html"
  Delete "$INSTDIR\doc\en\UsingCustomIconSets.html"
  Delete "$INSTDIR\doc\en\Undo.html"
  Delete "$INSTDIR\doc\en\Toolbar.html"
  Delete "$INSTDIR\doc\en\TimeDate.html"
  Delete "$INSTDIR\doc\en\Templates.html"
  Delete "$INSTDIR\doc\en\SyntaxHighlighting.html"
  Delete "$INSTDIR\doc\en\StatusBar.html"
  Delete "$INSTDIR\doc\en\SourceBrowser.html"
  Delete "$INSTDIR\doc\en\SelectAll.html"
  Delete "$INSTDIR\doc\en\SaveAsWebPage.html"
  Delete "$INSTDIR\doc\en\SaveAs.html"
  Delete "$INSTDIR\doc\en\SaveAll.html"
  Delete "$INSTDIR\doc\en\Save.html"
  Delete "$INSTDIR\doc\en\RTextHelpDialog_es.properties"
  Delete "$INSTDIR\doc\en\RTextHelpDialog.properties"
  Delete "$INSTDIR\doc\en\RText.html"
  Delete "$INSTDIR\doc\en\ReplaceNext.html"
  Delete "$INSTDIR\doc\en\ReplaceAll.html"
  Delete "$INSTDIR\doc\en\Replace.html"
  Delete "$INSTDIR\doc\en\Redo.html"
  Delete "$INSTDIR\doc\en\QuickSearchBar.html"
  Delete "$INSTDIR\doc\en\PrintPreview.html"
  Delete "$INSTDIR\doc\en\Print.html"
  Delete "$INSTDIR\doc\en\Paste.html"
  Delete "$INSTDIR\doc\en\OptionsUserInterface.html"
  Delete "$INSTDIR\doc\en\OptionsTextArea.html"
  Delete "$INSTDIR\doc\en\OptionsTemplates.html"
  Delete "$INSTDIR\doc\en\OptionsSyntaxHighlighting.html"
  Delete "$INSTDIR\doc\en\OptionsSourceBrowser.html"
  Delete "$INSTDIR\doc\en\OptionsShortcuts.html"
  Delete "$INSTDIR\doc\en\OptionsPrinting.html"
  Delete "$INSTDIR\doc\en\OptionsMacros.html"
  Delete "$INSTDIR\doc\en\OptionsLanguage.html"
  Delete "$INSTDIR\doc\en\OptionsGeneral.html"
  Delete "$INSTDIR\doc\en\OptionsFileFilters.html"
  Delete "$INSTDIR\doc\en\OptionsFileChooser.html"
  Delete "$INSTDIR\doc\en\OptionsDialog.html"
  Delete "$INSTDIR\doc\en\OpenInNewWindow.html"
  Delete "$INSTDIR\doc\en\Open.html"
  Delete "$INSTDIR\doc\en\New.html"
  Delete "$INSTDIR\doc\en\MenuBar.html"
  Delete "$INSTDIR\doc\en\MacrosStopRecording.html"
  Delete "$INSTDIR\doc\en\MacrosRecordingTemporary.html"
  Delete "$INSTDIR\doc\en\MacrosRecording.html"
  Delete "$INSTDIR\doc\en\MacrosPlayback.html"
  Delete "$INSTDIR\doc\en\MacrosMenu.html"
  Delete "$INSTDIR\doc\en\Macros.html"
  Delete "$INSTDIR\doc\en\LookAndFeel.html"
  Delete "$INSTDIR\doc\en\LineNumbers.html"
  Delete "$INSTDIR\doc\en\License.txt"
  Delete "$INSTDIR\doc\en\JoinLines.html"
  Delete "$INSTDIR\doc\en\Introduction.html"
  Delete "$INSTDIR\doc\en\InsertOverwriteModes.html"
  Delete "$INSTDIR\doc\en\IncreaseIndent.html"
  Delete "$INSTDIR\doc\en\HelpMenu.html"
  Delete "$INSTDIR\doc\en\GoTo.html"
  Delete "$INSTDIR\doc\en\FormatMenu.html"
  Delete "$INSTDIR\doc\en\FindNext.html"
  Delete "$INSTDIR\doc\en\Find.html"
  Delete "$INSTDIR\doc\en\FileMenu.html"
  Delete "$INSTDIR\doc\en\FileChooser.html"
  Delete "$INSTDIR\doc\en\FAQ.html"
  Delete "$INSTDIR\doc\en\EditMenu.html"
  Delete "$INSTDIR\doc\en\Developers.html"
  Delete "$INSTDIR\doc\en\DeleteToLineEnd.html"
  Delete "$INSTDIR\doc\en\Delete.html"
  Delete "$INSTDIR\doc\en\DefiningShortcuts.html"
  Delete "$INSTDIR\doc\en\DefiningFileFilters.html"
  Delete "$INSTDIR\doc\en\DecreaseIndent.html"
  Delete "$INSTDIR\doc\en\Cut.html"
  Delete "$INSTDIR\doc\en\Copy.html"
  Delete "$INSTDIR\doc\en\CloseAll.html"
  Delete "$INSTDIR\doc\en\Close.html"
  Delete "$INSTDIR\doc\en\Changes.txt"
  Delete "$INSTDIR\doc\en\BugList.html"
  Delete "$INSTDIR\doc\en\Background.html"
  Delete "$INSTDIR\doc\en\AllEditOptions.html"
  Delete "$INSTDIR\doc\en\aboutdialogimage.jpg"
  Delete "$INSTDIR\RText.exe"

  Delete "$SMPROGRAMS\RText\Uninstall.lnk"
  Delete "$SMPROGRAMS\RText\Website.lnk"
  Delete "$DESKTOP\RText.lnk"
  Delete "$SMPROGRAMS\RText\RText.lnk"

  RMDir "$SMPROGRAMS\RText"
  RMDir "$INSTDIR\plugins"
  RMDir "$INSTDIR\lnfs"
  RMDir "$INSTDIR\icongroups"
  RMDir "$INSTDIR\doc\en"
  RMDir "$INSTDIR\doc"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd