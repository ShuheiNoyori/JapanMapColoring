# JapanMapColoring
データに基づいて日本地図を着色 

![map_color.png](map_color.png)  

## 解析環境
- R 3.6.1 on Windows 10 (64-bit)

## 参考
- [塗り分け地図を描く](http://aoki2.si.gunma-u.ac.jp/R/color-map.html): ここで実装されている関数をそのまま使用  
  - ここから地図データをダウンロードしてワーキングディレクトリに置いておく必要あり
    > jpn.zipをダウンロードし，展開する。  
    > 展開されてできた jpn フォルダには，"01" ～ "50" の50個のファイルが含まれている。  
    > 展開した jpn フォルダを，R のワーキングディレクトリーに移動（コピー）する。  
    > （あるいは，展開したファイルが含まれるディレクトリをワーキングディレクトリーとする）。  
- [統計グラフの色](https://oku.edu.mie-u.ac.jp/~okumura/stat/colors.html): カラーマップはここを参考にした

## ファイル
- move.csv: サンプルデータ. No列は都道府県コード, Move列は東京発のある人口移動のデータ (1より大きいものは増加, 1より小さいものは減少を表す)  
- map_color.R: move.csvから画像を書き出す.  
- map_color.png: map_color.Rで書き出した画像
