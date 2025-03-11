cd ./avatar

git add -N --all
git diff --name-only > ./diff.log

cd ..

if [ -s ./diff.log ]; then
    echo 'texture_compressed=true' >> $GITHUB_OUTPUT
else
    echo 'texture_compressed=false' >> $GITHUB_OUTPUT
fi

echo "compressed_textures=$(cat ./diff.log | awk -f ./compressor/scripts/output_compressed_textures.awk)" >> $GITHUB_OUTPUT
