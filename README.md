# my_hhkb_ahk
  
MyHHKB.ahk  
わたしのHHKBセッティング  
  
職場のPCは他の人が使うことがあるために「自分はすべてHHKBで作業したい」「他の人が自分のPCをさわる時には普通の日本語配列に戻したい」ので作りました。  
  
## 環境
  
Windows11 (2023-02時点)  
HHKB 英語配列 Type-S  
  
## 要件
  
* 左右の◇キーを半角、全角に設定する
* Windowsの日本語配列と英語配列をAutohotkeyだけで切り替え可能にする
* 他の人が自分のPCを使うときに日本語配列に戻せること
  
## 初期設定
  
[Change Key](https://forest.watch.impress.co.jp/library/software/changekey/)で「全角/半角」キーをF13(スキャンコード:0x0064)に変更する  
  
DIPスイッチ  
1:On  
2:Off // WinMode  
3:On // Delete=BS  
4:On // Left◇=Fn
5:On // ◇=Alt, Alt=◇  
6:On // Power Saving Disabled
  
## 実行
  
以下を実行する  
  
* MyScript.ahk(メインの実行スクリプト)  
  個人的な設定がはいってます。  
  alt-ime-ahkも実行しています。  
  
* jp2usKeylayout.ahk(日本語配列->英語配列変更スクリプト)
  
席を離れるときは上記を終了し、以下を実行  
  
* nomKeylayout.ahk(F13を「全角/半角」キーにするスクリプト)
  
このようにすることで他の人が別に接続された日本語配列のキーボードで操作できるようになります。  
  
## 参考
  
[【キーマップ変更】日本語配列キーボードを英語配列に変更【英語配列のメリットについて】](https://www.nintechblog.com/keymap-jis-us/)  
少し変更してHHKB 英語配列 Type-S用にしてます。  
  
[HHKB Classic 英語配列を使うときのおすすめ設定方法](https://yashulog.com/recommended-setting-of-hhkb-classic/)  
ほんどこれの設定を使わせてもらって自分用にアレンジしてます。
  
[karakaram/alt-ime-ahk github](https://github.com/karakaram/alt-ime-ahk)  
記事↓  
[WindowsのAlt空打ちで日本語入力(IME)を切り替えるツールを作った](https://www.karakaram.com/alt-ime-on-off/)  
そのままリポジトリに取り込ませてもらいました。  
  
## 補足
  
普段は日本語配列は無変換キーを修飾キーにしてvimっぽいバインドをしています。  
  
