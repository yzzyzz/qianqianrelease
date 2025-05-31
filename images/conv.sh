#!/bin/bash

# 定义输入文件和输出文件
bg="bg1.png"
subimg1="playlist.png"
subimg2="lrc.png"
subimg3="podcast.png"
output="combined.png"
font_path="SourceHanSansCN/SourceHanSansCN-Bold.otf"  # 自定义字体路径
font_size=55         # 字体大小
text_offset=10       # 文字与图片底部的距离

# 创建临时带文字标注的子图片（统一设置）
convert "$subimg1" \
        -font "$font_path" \
        -background red \
        -fill white \
        -pointsize "$font_size" \
        -gravity south \
        -annotate "+0+$text_offset" "播放列表" temp_subimg1.png

convert "$subimg2" \
        -font "$font_path" \
        -background none \
        -fill white \
        -pointsize "$font_size" \
        -gravity south \
        -annotate "+0+$text_offset" "歌词滚动" temp_subimg2.png

convert "$subimg3" \
        -font "$font_path" \
        -background none \
        -fill white \
        -pointsize "$font_size" \
        -gravity south \
        -annotate "+0+$text_offset" "播客订阅" temp_subimg3.png

# 水平拼接三张带文字的子图
convert +append temp_subimg1.png temp_subimg2.png temp_subimg3.png temp_subimgs.png

# 将拼接后的子图缩小至 90%，然后叠加到背景图上
convert "$bg" \
        \( temp_subimgs.png -resize 90% \) \
        -gravity center -geometry +0+10 \
        -composite "$output"

# 清理临时文件
rm temp_subimg1.png temp_subimg2.png temp_subimg3.png temp_subimgs.png