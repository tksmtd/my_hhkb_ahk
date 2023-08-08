#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#InstallKeybdHook
#UseHook
#SingleInstance, Force

/*
以下の文で、キー配置の入れ替えと、キー同時押し時の動作を定義している。
*/

;日本語配列を英語配列に
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 1段目
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
+2::Send,{@} ; Shift + 2 ["] -> @
+6::Send,{^} ; Shift + 6 [&] -> ^
+7::Send,{&} ; Shift + 7 ['] -> &
+8::Send,{*} ; Shift + 8 [(] -> *
+9::Send,{(} ; Shift + 9 [)] -> (
+0::Send,{)} ; Shift + 0 [ ] -> )
+-::Send,{_} ; Shift + - [=] -> _
^::Send,{=}  ;           [^] -> =
+^::Send,{+} ; Shift + ^ [~] -> +
]::Send,{\}  ;           []] -> \

; `[~]キーは日本語配列では半角/全角キーに認識されているのでchangekeyにてF13キーに置き換えてから`[~]キーに変更する
F13::Send,{``} ;         [F13] -> `
+F13::Send,{~} ; Shift + [F13] -> ~

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 2段目
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@::[         ;           [@] -> [
+@::{        ; Shift + @ [`] -> {
[::]         ;           [[] -> ]
+[::Send,{}} ; Shift + [ [{] -> }

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 3段目
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
+;::Send,{:} ; Shift + ; [+] -> :
:::Send,{'}  ;           [:] -> '

*::Send,{"}  ; Shift + : [*] -> "
+]::|        ; Shift + ] [}] -> |

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 以下は個人的な設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MyScriptにAlt修飾のスクリプトを記載しても動かないのでこちらに書く

; Vim Like Settings

; Blindが効かないのはalt-ime-ahkが原因か

; Alt + hjkl で←↓↑→
!h::Send,{Left}
!j::Send,{Down}
!k::Send,{Up}
!l::Send,{Right}

; Shift + hjkl で←↓↑→
+!h::Send,+{Left}
+!j::Send,+{Down}
+!k::Send,+{Up}
+!l::Send,+{Right}

; Alt + i でHome
!i::Send,{Home}

; Alt + a でEnd
!a::Send,{End}

; 無変換+oで行を追加
!o::send, {End}{Enter}

; Alt + x でDelete
!x::Send,{Delete}

; Alt + w で単語を進む
!w::send,^{Right}
; Alt + b で単語を戻る
!b::send,^{Left}

; Alt + y コピー、Alt+ yy で行をすべて選択してコピーする
Alt & y::
  Keywait, y, U
  Keywait, y, D T0.2
  If (ErrorLevel=1){	
    send, ^c
  } else {
    send, {Home}{LShift Down}{End}{LShift Up}^c
  }
  return

; RAlt + [l][;][p][.] で [left][right][up][down]
  ; >!' はあらゆるキーで試したが動作しなかった為、[l][;][p][.]を[left][right][up][down]をした

>!`;::send, {Right}
>!p::send, {Up}
>!.::send, {Down}
>!l::send, {Left}


; Alt + p でペースト
!p::send,^v

; ■■■Vivaldi上でのショートカット■■
#IfWinActive ahk_exe vivaldi.exe
; Alt + e で gi -> ctrl + a
!e::send, gi^a

