source("http://aoki2.si.gunma-u.ac.jp/R/src/map.R", encoding="euc-jp") # ここのmap.Rを使う

data <- read.csv("move.csv")

# 値が[0, 1]の範囲に収まるように変換 <- colorRamp()の引数が[0, 1]の範囲のため
# ただし、もとのデータの"1"が変換後に0.5になるようにして線形に変換 (∵増減のデータなので変化なしを中心にしたい)
# 最大値の方が1から離れていることが事前にわかっていたため変換には最大値を使用
max.move = max(data$Move)
min.move = min(data$Move)
scaled = (data$Move - 1)/(max.move - 1)*0.5 + 0.5
# scaled = (data$Move - min.move)/(max.move - min.move) # データの中心を気にせず正規化する場合はこちら

# 色を設定
# colorRamp()にはカラーマップの色をベクトルで与える
# colの引数は[0, 1]の実数値 or 実数値のベクトル, 戻り値は(r, g, b)のベクトル (引数をベクトル(|x|=n)で与えた場合は3 x nの行列). r, g, b ∈ [0, 255]
cols = colorRamp(c("#0080ff","white","#ff8000")) # 青-白-オレンジのカラーマップ
color0 = cols(scaled)/255 # あとで使うrgb()の引数は[0, 1]なので２５５で割って変換
color0[13,] = c(1, 0, 0) # 東京都（都道府県コード１３）のみ赤を指定

# 描画・保存
png("map_color.png", width = 500, height = 500) # 書き込み用ファイルを開く
map(data$No, color = rgb(color0)) # 描画
dev.off()
