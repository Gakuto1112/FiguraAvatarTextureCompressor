import * as fs from 'fs'

/**
 * 読み込んだbase64画像を一時保持するキャッシュ
 */
const cache: {[key: string]: string} = {};

/**
 * BBモデルのJSONを読み込み、組み込みテクスチャを圧縮したものに置き換える。
 */
function replaceEmbeddedTextures(modelPath: string, base64TexturePath: string): void {
    const modelFiles: fs.Dirent[] = fs.readdirSync(modelPath, {encoding: "utf-8", withFileTypes: true, recursive: true}).filter(entry => entry.isFile() && entry.name.endsWith(".bbmodel"));
    modelFiles.forEach((entry: fs.Dirent) => {
        const modelData: {[key: string]: any} = JSON.parse(fs.readFileSync(`${entry.parentPath}/${entry.name}`, {encoding: "utf-8"}));
        modelData["textures"].forEach((textureData: {[key: string]: number | string}) => {
            if(typeof(cache[modelData["name"]]) == "string") {
                textureData["source"] = `data:image/png;base64,${cache[modelData["name"]]}`;
            }
            else if(fs.existsSync(`${base64TexturePath}/${modelData["name"]}.txt`)) {
                const base64TextureData: string = fs.readFileSync(`${base64TexturePath}/${modelData["name"]}.txt`, {encoding: "utf-8"});
                textureData["source"] = `data:image/png;base64,${base64TextureData}`;
                cache[modelData["name"]] = base64TextureData;
            }
        });
        fs.writeFileSync(`${entry.parentPath}/${entry.name}`, JSON.stringify(modelData, null, 4), {encoding: "utf-8"});
    });
}

replaceEmbeddedTextures(process.argv[2], process.argv[3]);
