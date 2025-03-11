if [ ! -d ${TEXTURE_PATH} ]; then
    echo "[Error]: Cannot find directory \"${TEXTURE_PATH}\""
    no_directory_ditected=true
fi

if [ ! -d ${MODEL_PATH} ]; then
    echo "[Error]: Cannot find directory \"${MODEL_PATH}\""
    no_directory_ditected=true
fi

if ${no_directory_ditected}; then
    exit 1
fi
