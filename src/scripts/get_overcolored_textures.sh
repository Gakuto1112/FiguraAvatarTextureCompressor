cat ./pngquant.log | awk -f ./compressor/src/scripts/warn_overcolored_textures.awk > ./overcolored_textures.csv

if [ -s ./overcolored_textures.csv ]; then
    echo 'texture_overcolored=true' >> $GITHUB_OUTPUT
else
    echo 'texture_overcolored=false' >> $GITHUB_OUTPUT
fi
