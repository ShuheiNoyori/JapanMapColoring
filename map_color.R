source("http://aoki2.si.gunma-u.ac.jp/R/src/map.R", encoding="euc-jp")

data <- read.csv("move.csv")

# 値が0-1の範囲に収まるように変換
# ただし、もとのデータの"1"が変換後に0.5になるようにして線形に変換
# 最大値の方が1から離れていることが事前にわかっていたため変換には最大値を使用
max.move = max(data$Move)
min.move = min(data$Move)
scaled = (data$Move - 1)/(max.move - 1)*0.5 + 0.5

cols = colorRamp(c("#0080ff","white","#ff8000")) # 青-オレンジのグラデーション
color0 = cols(scaled)/255
color0[13,] = c(1, 0, 0)

png("map_color.png", width = 500, height = 500)
map(data$No, color = rgb(color0))
dev.off()