# nitac-texlive-ja

> 阿南工業高等専門学校 情報コース 卒業論文の LaTeX テンプレートリポジトリ <br> [電気情報通信学会和文論文誌](https://www.ieice.org/jpn/shiori/cs_2.html) の LaTeX テンプレートをもとに作成する．

## フォルダ構造

```
├── Dockerfile
├── README.md (本ファイル)
├── draft
│   ├── ipsjcommon.sty
│   ├── ipsjdrafts.sty
│   ├── ipsjpapers.cls
│   ├── ipsjpapers.sty
│   └── nitac-drafts.tex (卒論ドラフトテンプレート)
├── latexmkrc
├── paper
│   ├── ieicej.cls
│   ├── nitac-paper.tex (卒業論文テンプレート)
│   └── sieicej.bst
└── scripts
    ├── texc.ps1 (Windows 環境用コンパイルスクリプト)
    └── texc.sh  (Mac・Linux 環境用コンパイルスクリプト)
```

## 使い方

### 1. Dockerfile のビルド

- [paperist/texlive-ja](https://hub.docker.com/r/paperist/texlive-ja/) をもとに作った Dockerfile をビルドする．

```
git clone https://github.com/nitac-info/nitac-texlive-ja
cd nitac-texlive-ja
docker build -t nitac-texlive-ja .
```

### 2. LaTeX ファイルのコンパイル

> それぞれ環境変数や alias に追加すると便利に使えそう

#### Windows

> 拡張子は必要ない．

```
./scripts/texc.ps1 ファイル名
```

#### Mac・Linux(bash)

```
chmod +x ./scripts/texc.sh
./scripts/texc.sh ファイル名.tex
```

## その他

### Visual Studio Code + LaTeX Workshop で自動コンパイルを行う

1. [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) をインストール
2. Visual Studio Code の `settings.json` に以下を追加する([開き方](https://code.visualstudio.com/docs/getstarted/settings))
3. 自身の論文作成フォルダに `latexmkrc` ファイルをコピー

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
