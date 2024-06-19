
;~ AutoHotkey scipt to automatically import CDR prices into Quicken
;~ Developed by Dennis - 2024-05-09 - denbe52@yahoo.com

{  ;~ Directives & Initialization
   #Requires AutoHotkey v2.0
   #SingleInstance force
   #Warn  ; Enable warnings to assist with detecting common errors.
   SendMode "Input"
}

#HotIf WinActive("ahk_exe qw.exe")        ; Quicken hotkeys
{
   get_cdr_prices()   ; import CDR prices into Quicken
   {
      Send "{Alt Down}f{Alt Up}ii"
      Sleep 1000
      A_Clipboard := "C:\py\CDR_prices\CDR_prices.csv"  ;- <---- put the path to your csv file here
      Send "^v"
      Send "{Tab 4}"
      Sleep 1500
      Send "{Enter}"
      Sleep 3000
      Send "{Enter}"

      Sleep 6000
   }

   one_step_update()  ;~ perform a One-Step Update
   {
      Send "{CtrlDown}1{CtrlUp}"
      Sleep 1000
      Send "U"
   }

   F5::  ; get_cdr_prices()
   {
      get_cdr_prices()
      return
   }

   F6::  ; One Step Update
   {
      one_step_update()
      return
   }

   F7::  ; get_cdr_prices(), one_step_update()
   {
      get_cdr_prices()
      one_step_update()
      return
   }
}

#HotIf ; Reset #HotIf
