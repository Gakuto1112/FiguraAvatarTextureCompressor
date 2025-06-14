while read file color_num
do
    echo "::warning file=${file},title=Overcolored texture::This texture had ${color_num} colors, but reduced to 256 colors."
    gh api \
        --method POST \
        -H "Accept: application/vnd.github+json" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        /repos/${REPOSITORY}/commits/${TARGET_COMMIT}/comments \
        -f "body=\"${file}\" had ${color_num} colors, but reduced to 256 colors. Please check its quality."
done < ./overcolored_textures.csv