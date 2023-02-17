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
F13::Send,{``}  ;         [F13] -> `
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

; Alt + i でHome
!i::Send,{Home}

; Alt + a でEnd
!a::Send,{End}

; Alt + w で単語を進む
!w::send,^{Right}
; Alt + b で単語を戻る
!b::send,^{Left}

