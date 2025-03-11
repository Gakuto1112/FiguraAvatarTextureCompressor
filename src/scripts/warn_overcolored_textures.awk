{
    # 圧縮対象のテクスチャファイル名を取得
    if(match($0, /^(\.\/.+\.png):$/, matched_str)) {
        file_name = matched_str[1]
    }

    # 256色を超えるテクスチャに対して警告を出力
    if(match($0, /^\s\smade\shistogram\.\.\.([0-9]+)\scolors\sfound$/, matched_str) && length(file_name) >= 1) {
        color_num = strtonum(matched_str[1])
        if(color_num > 256) {
            print "[WARN]: \"" file_name "\" has " color_num " colors and reduced to 256 colors."
        }
    }
}
