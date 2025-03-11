mkdir ./base64_textures

for texture in $(cat ${COMPRESSED_TEXTURES} | jq .[]); do
    base64 ./${TEXTURE_PATH}$(echo ${texture} | sed "s/\"//g") -w 0 > ./base64_textures/$(echo ${texture} | sed -r 's/^"((.+)\/)?(.+\.png)"$/\3/').txt
done
