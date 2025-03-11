find ./avatar/${TEXTURE_PATH} -name '*.png' -exec pngquant --speed 1 --ext .png --skip-if-larger --verbose --strip --force {} \; 2> ./pngquant.log
cat ./pngquant.log
