#!/bin/bash
convert bginit3.png -resize 2880x1800^ -gravity center -crop 2880x1800+0+0 +repage bg1.png

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
        -annotate "+0+$text_offset" "桌面歌词-三大主题" temp_subimg8.png

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


#!/bin/bash

# 输出文件名
output="千千倾听txt.png"
# 字体和样式配置
font_path="SourceHanSansCN/SourceHanSansCN-Bold.otf"  # 使用你自己的字体路径
font_size=280        # 字体大小
text_color="white"  # 文字颜色
text="千千倾听"  # 要显示的文字内容

# 生成透明背景的文字图片
convert -size 1400x400 \
        xc:transparent \
        -font "$font_path" \
        -fill "$text_color" \
        -pointsize "$font_size" \
        -gravity center \
        -annotate +0+0 "$text" "$output"


output="desc.png"
# 字体和样式配置
font_path="SourceHanSansCN/SourceHanSansCN-Medium.otf"  # 使用你自己的字体路径
font_size=100        # 字体大小
text_color="white"  # 文字颜色
text="无损音乐、播客订阅、网络电台\n有声小说、传统评书、一网打尽"  # 要显示的文字内容

# 生成透明背景的文字图片
convert -size 1600x500 \
        xc:transparent \
        -font "$font_path" \
        -fill "$text_color" \
        -pointsize "$font_size" \
        -gravity center \
        -annotate +0+0 "$text" "$output"


output="slogan.png"
# 字体和样式配置
font_path="SourceHanSansCN/SourceHanSansCN-Bold.otf"  # 使用你自己的字体路径
font_size=170        # 字体大小
text_color="red"  # 文字颜色
text="让你的6扬声器\n永不停息！"  # 要显示的文字内容

# 生成透明背景的文字图片
convert -size 1200x500 \
        xc:transparent \
        -font "$font_path" \
        -fill "$text_color" \
        -pointsize "$font_size" \
        -gravity center \
        -annotate +0+0 "$text" "$output"

bg="bg1.png"
convert "$bg" \
        \( 千千倾听txt.png -resize 100% \) \
        -gravity center -geometry -660-500 \
        -composite "tmp1.png"

convert "tmp1.png" \
        \( desc.png -resize 100% \) \
        -gravity center -geometry -600+0 \
        -composite "tmp2.png"


convert "tmp2.png" \
        \( 6ysq.png -resize 50% \) \
        -gravity center -geometry -660+500 \
        -composite "tmp3.png"

convert "tmp3.png" \
        \( audiobooks.png -resize 100% \) \
        -gravity center -geometry +800+50 \
        -composite "front.png"

rm "tmp1.png" "tmp2.png" "tmp3.png"


output="dujia.png"
# 字体和样式配置
font_path="SourceHanSansCN/SourceHanSansCN-Medium.otf"  # 使用你自己的字体路径
font_size=70        # 字体大小
text_color="white"  # 文字颜色
text="特色功能:\n-全拼、简拼搜歌，无需选字\n-真•桌面歌词、工作区置顶显示、三大主题\n-全局多功能快捷键\n     顺序切歌、随机切歌、F9一键盲操\n-简单而不简约,更多功能等你挖掘~"  # 要显示的文字内容

# 生成透明背景的文字图片
convert -size 1900x600 \
        xc:transparent \
        -font "$font_path" \
        -fill "$text_color" \
        -pointsize "$font_size" \
        -gravity west \
        -annotate +0+0 "$text" "$output"

bg="bg1.png"
convert "$bg" \
        \( dujia.png -resize 100% \) \
        -gravity center -geometry -300-0 \
        -composite "tmp1.png"
convert "tmp1.png" \
        \( wusun.png -resize 100% \) \
        -gravity center -geometry +800+50 \
        -composite "tmp2.png"

convert "tmp2.png" \
        "$lrc_std" \
        -gravity northwest -composite tmp3.png

convert "tmp3.png" \
        "$lrc_mini" \
        -gravity southwest -composite tese.png
