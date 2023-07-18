#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory
; #Warn  ; Enable warnings to assist with detecting common errors.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; HHKB Settings

; 初期設定
; changekeyで半角全角キーをF13(0x0064)に設定する


; 左右Altで全角と半角を切り替える設定
#Include alt-ime-ahk.ahk

; テスト中 本元のスクリプト
; https://w.atwiki.jp/eamat/pages/17.html
; 
; #Include IME2.ahk

; 日本語配列から英語配列にする
; -> 別途jp2usKeylayoutを起動


; 他の人が使うとき
; -> MyScript.ahkを終了する
; -> nomKeylayout.ahkを起動する

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; nomkey設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; nomkeylayoutのみで有効
;    vk1d(無変換)キーはhhkbでは無効!

; ■■■使わないキーを無効にする■■■
; NumLock
NumLock::Return
; Insert
Insert::Return

; 単体ボタンの再設定用
; 中クリック
MButton::MButton
; 無変換
vk1d::vk1d

;Winシャットダウンコマンド
#Esc::Shutdown, 1

; ■■■マウス系■■■
; Shift + Wheel 水平スクロール
+WheelDown::WheelRight
+WheelUp::WheelLeft

; win+zで右クリック
#z::send,{RButton}

; 中クリックを押しながらスクロールで水平スクロール
MButton & WheelDown::WheelRight
MButton & WheelUp::WheelLeft


; ■■■無変換+でvim keybind■■■
; 十字キーで移動
vk1d & k::send, {Blind}{Up}
vk1d & j::send, {Blind}{Down}
vk1d & l::send, {Blind}{Right}
vk1d & h::send, {Blind}{Left}

; 無変換+d, 無変換+uで一気に移動する
; vk1d & d::send, {Blind}{PgDn} => 無変換+ddの項目に記載
vk1d & u::send, {Blind}{PgUp}

; 無変換+wで単語を進む
vk1d & w::send, {Blind}^{Right}
; 無変換+bで単語を戻る
vk1d & b::send, {Blind}^{Left}

; 無効: 無変換+fで選択しながら進む、bで選択しながら戻る
; Todo: vf, vb に割り当てたい
; vk1d & f::send, {Blind}+{Right}
; vk1d & b::send, {Blind}+{Left}

; 無変換+0で行の先頭、aで行の後ろへ
vk1d & 0::send, {Blind}{Home}
vk1d & a::send, {Blind}{End}

; 無変換+iで行の最初の文字へ
vk1d & i::
  ; 退避
  clipboard_backup = %ClipboardAll%
  ; カーソルが先頭になるように、
  ; 先頭一文字を選択
  Send {Home}{Right}+{Home}
  ; 選択範囲を読み取る
  Clipboard :=
  Send ^c
  ClipWait, 1
  selected := Clipboard
  ; クリップボードの内容を復元
  Clipboard := clipboard_backup
  ; 先頭の一文字を取得
  c := selected
  ; インデント文字かどうかで分岐
  If (c = " " || c = "`t") {
    Send ^{Right} ; 単語単位の移動を利用して移動
  } Else {
    Send {Left}
  }
  Return

; 無変換+gで最後へ、ggで先頭へ
vk1d & g::
  Keywait, g, U
  Keywait, g, D T0.2
  If (ErrorLevel=1){
    ; 直前のコマンド＝Keywaitがタイムアウトで失敗＝1であれば、g
    send, {Blind}^{End}
  } else {
    ; ggの場合
    Send, {Blind}^{Home}
  }
  return

; 無変換+oで行を追加
vk1D & o::send, {End}{Enter}

; 無変換+xで前の1文字を削除
vk1D & x:: send, {Right}{BS}
; 無変換+zで後ろの1文字を削除
vk1D & z:: send, {BS}

; 無変換+yですべてコピー、yyで行をすべて選択してコピーする
vk1d & y::
  Keywait, y, U
  Keywait, y, D T0.2
  If (ErrorLevel=1){	
    send, ^a^c
  } else {
    send, {Home}{LShift Down}{End}{LShift Up}^c
  }
  return

; 無変換+pでペーストする
vk1d & p::Send, ^v

; 無変換+vwで単語を選択する
vk1d & v::
    Input,InputChar,C I L1 T2,{Esc},w
    If ErrorLevel = Match
    {
        If InputChar = w
            Send,^{Left}+^{Right}
    }
    Return


; 無変換+dwで単語を削除する
;; Todo: C-d,C-wが解決できない。

;; vk1d ::Send, ^{Left}+^{Right}{Backspace}
; vk1d & d::
;     Input,InputChar,C I L1 T2,{Esc},w,d
;     If ErrorLevel = Match
;     {
;         If InputChar = w
;             Send, ^{Left}+^{Right}{Backspace}
;         If InputChar = vk1d & d
;             Send, {Home}{LShift Down}{End}{Del}{LShift Up}{BS}{Home}
;     }
;     Return

; 無変換+dで下へ一気に移動、無変換+ddで1行削除
vk1d & d::
  Keywait, d, U
  Keywait, d, D T0.2
  If (ErrorLevel=1){
    ; d一気に下に移動する
     send, {Blind}{PgDn}
  } else {
    send, {Home}{LShift Down}{End}{Del}{LShift Up}{BS}{Home}
  }
  return

;■Optional
; 無変換+qでEsc
vk1D & q:: send, {Esc}



; ■■■Vivaldi上でのショートカット■■
#IfWinActive ahk_exe vivaldi.exe
; 無変換 + e で gi -> ctrl + a
vk1D & e::send, gi^a




; ■■■実験的機能: 無変換+文字キー2個押し■■
; https://retu27.com/autohotkey_many_shortcut2.html

; 無理だった。

;;変換キーを押したら、func2keyを呼び出す
;vk1C::func2key()
;;変換キーを押した後の処理
;func2key(){
 ;;2キーの入力を待つ
; Input, UserInput, L2
 ;;押された2つのキーのパターンで、ショートカット判別
; switch UserInput{
;  case "jn": HotString("style='border: solid 2px #aaaaaa'")
; }
;}
