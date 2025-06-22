#!/bin/bash
convert bginit.png -resize 2880x1800^ -gravity center -crop 2880x1800+0+0 +repage bg1.png

# 定义输入文件和输出文件
bg="bg1.png"
subimg1="playlist.png"
subimg2="wusun.png"
subimg3="lrc.png"
output="combined1.png"
font_path="SourceHanSansCN/SourceHanSansCN-Bold.otf"  # 自定义字体路径
font_size=60        # 字体大小
text_offset=10       # 文字与图片底部的距离
# 创建临时带文字标注的子图片（统一设置）
convert "$subimg1" \
        -font "$font_path" \
        -background red \
        -fill white \
        -pointsize "$font_size" \
        -gravity south \
        -annotate "+0+$text_offset" "自定义列表" temp_subimg1.png

convert "$subimg2" \
        -font "$font_path" \
        -background none \
        -fill white \
        -pointsize "$font_size" \
        -gravity south \
        -annotate "+0+$text_offset" "无损播放" temp_subimg2.png

convert "$subimg3" \
        -font "$font_path" \
        -background none \
        -fill white \
        -pointsize "$font_size" \
        -gravity south \
        -annotate "+0+$text_offset" "歌词滚动" temp_subimg3.png

# 水平拼接三张带文字的子图
convert +append temp_subimg1.png temp_subimg2.png temp_subimg3.png temp_subimgs.png

# 将拼接后的子图缩小至 90%，然后叠加到背景图上
convert "$bg" \
        \( temp_subimgs.png -resize 90% \) \
        -gravity center -geometry +0+10 \
        -composite "$output"

# 清理临时文件
rm temp_subimg1.png temp_subimg2.png temp_subimg3.png temp_subimgs.png






bg="bg1.png"
subimg1="station.png"
subimg2="audiobooks.png"
subimg3="podcast.png"
output="combined2.png"
font_path="SourceHanSansCN/SourceHanSansCN-Bold.otf"  # 自定义字体路径
font_size=60        # 字体大小
text_offset=10       # 文字与图片底部的距离
# 创建临时带文字标注的子图片（统一设置）
convert "$subimg1" \
        -font "$font_path" \
        -background red \
        -fill white \
        -pointsize "$font_size" \
        -gravity south \
        -annotate "+0+$text_offset" "网络收音机" temp_subimg1.png

convert "$subimg2" \
        -font "$font_path" \
        -background none \
        -fill white \
        -pointsize "$font_size" \
        -gravity south \
        -annotate "+0+$text_offset" "有声书" temp_subimg2.png

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


subimg3="lrc.png"
convert "$subimg3" \
        -font "$font_path" \
        -background none \
        -fill white \
        -pointsize "$font_size" \
        -gravity south \
        -annotate "+0+$text_offset" "桌面歌词" temp_subimg8.png

# 定义输入文件和输出文件
bg="bg1.png"
temp_subimg8="temp_subimg8.png"
lrc_mini="lrc_mini.png"
lrc_jijian="lrc_jijian.png"
lrc_std="lrc_std.png"
output="final_output.png"

# 将 temp_subimg8 居中放置在 bg 上
convert "$bg" \
        \( $temp_subimg8 -resize 92% \) \
        -gravity center -geometry +0+10 \
        -composite temp_center.png

# 将 lrc_mini 放置在左上角
convert "temp_center.png" \
        "$lrc_std" \
        -gravity northwest -composite temp_left_top.png

# 将 lrc_jijian 放置在右上角
convert "temp_left_top.png" \
        "$lrc_mini" \
        -gravity northeast -composite temp_right_top.png

# 将 lrc_mini 放置在右下角
convert "temp_right_top.png" \
        "$lrc_jijian" \
        -gravity southeast -composite "$output"

# 清理临时文件
rm temp_center.png temp_left_top.png temp_right_top.png

