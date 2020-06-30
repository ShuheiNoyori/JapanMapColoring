source("http://aoki2.si.gunma-u.ac.jp/R/src/map.R", encoding="euc-jp")

data <- read.csv("move.csv")

# �l��0-1�͈̔͂Ɏ��܂�悤�ɕϊ�
# �������A���Ƃ̃f�[�^��"1"���ϊ����0.5�ɂȂ�悤�ɂ��Đ��`�ɕϊ�
# �ő�l�̕���1���痣��Ă��邱�Ƃ����O�ɂ킩���Ă������ߕϊ��ɂ͍ő�l���g�p
max.move = max(data$Move)
min.move = min(data$Move)
scaled = (data$Move - 1)/(max.move - 1)*0.5 + 0.5

cols = colorRamp(c("#0080ff","white","#ff8000")) # ��-�I�����W�̃O���f�[�V����
color0 = cols(scaled)/255
color0[13,] = c(1, 0, 0)

png("map_color.png", width = 500, height = 500)
map(data$No, color = rgb(color0))
dev.off()