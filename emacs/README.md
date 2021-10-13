# Emacsの設定作業

## 環境による使い分け

```
M-x describe-variable
```

xが出力された｡

なのでinit-x.elを新たに作ってinit.elに

```
(when (equal window-system 'w32)
  (load-file "~/dot/emacs/init-win.el"))
(when (equal window-system nil)
  (load-file "~/dot/emacs/init-linux.el"))
(when (equal window-system 'x)
  (load-file "~/dot/emacs/init-x.el"))
```

と書き加えた。




## クリップボード

nox版のemacsでコピペできてたのに急にできなくなったのでなんでかなと思ってたらx版だとx410入れてれば大丈夫なんだった｡

出てたエラーは以下の通り。

```
xsel: Can't open display: (null)
: Inappropriate ioctl for device
```

全部消したら問題解決。




## 日本語入力

###### インストール

emacs-mozc-binのインストール
```
sudo apt install emacs-mozc-bin
```

init-x.el
```
(require-package 'mozc)
(setq default-input-method "japanese-mozc")

```

mozc_toolのインストール
```
$ sudo apt install mozc-utils-gui
```

mozcの設定
```
$ /usr/lib/mozc/mozc_tool --mode=config_dialog
```

あとは↓にならう。
[mozcで句読点の設定 - 天炉48町](https://x.momo86.net/?p=138)

###### 半角/全角キーで日本語入力

```
(global-set-key [zenkaku-hankaku] 'toggle-input-method)
```




## 位置



## サイズ・レイアウト



## フォント

```
sudo apt install fonts-ipafont fonts-ipaexfont
```

```
$ sudo apt install fonts-migmix
$ sudo apt install fonts-ricty-diminished
```



## 色

```
M-x list-colors-display
```
で使える色が表示される。





## 画面オブジェクト



## ショートカットキー




