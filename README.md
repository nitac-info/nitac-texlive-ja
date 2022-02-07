# nitac-texlive-ja

> 阿南工業高等専門学校 情報コース 卒業論文の LaTeX テンプレートリポジトリ <br> [電気情報通信学会和文論文誌](https://www.ieice.org/jpn/shiori/cs_2.html) をもとにテンプレートを作成する．

## 使い方

### Dockerfile のビルド

[paperist/texlive-ja](https://hub.docker.com/r/paperist/texlive-ja/) をもとに作った Dockerfile をビルドする．

```
git clone https://github.com/nitac-info/nitac-texlive-ja
cd nitac-texlive-ja
docker build -t nitac-texlive-ja .
```

### Visual Studio Code + LaTeX Workshop で自動コンパイルを行う

1. [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) をインストール
2. Visual Studio Code の `settings.json` に以下を追加

```json
{
  "latex-workshop.docker.enabled": true,
  "latex-workshop.docker.image.latex": "nitac-texlive-ja",
  "latex-workshop.latex.tools": [
    {
      "name": "latexmk",
      "command": "latexmk",
      "args": ["-gg", "%DOC%"]
    }
  ],
  "latex-workshop.latex.autoClean.run": "onBuilt"
}
```
