no_directory_ditected=false

if [ ! -d ${TEXTURE_PATH} ]; then
    echo "[Error]: Cannot find directory \"$(echo ${TEXTURE_PATH} | sed -e 's/\.\/avatar\///g')\""
    no_directory_ditected=true
fi

if [ ! -d ${MODEL_PATH} ]; then
     echo "[Error]: Cannot find directory \"$(echo ${MODEL_PATH} | sed -e 's/\.\/avatar\///g')\""
    no_directory_ditected=true
fi

if ${no_directory_ditected}; then
    exit 1
fi
