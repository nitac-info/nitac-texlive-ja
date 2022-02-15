# nitac-texlive-ja

[paperist/texlive-ja](https://hub.docker.com/r/paperist/texlive-ja/) をカスタマイズして作った [nitac-info/nitac-graduation-thesis-template](https://github.com/nitac-info/nitac-graduation-thesis-template) のテンプレートをコンパイルするための Docker イメージ

## タグ一覧

- `latest`
  - AMD64, ARM64 に対応しています．

## 入っているもの

- tlmgr
  - newtx
  - fontaxes
  - boondox
  - txfonts
  - helvetic
  - latexindent

## インストール

### GitHub Container Registry

GitHub Container Registry からインストールできます．

```
docker pull ghcr.io/nitac-info/nitac-texlive-ja:latest
```

## 使い方

#### Windows(PowerShell)

```sh
docker run --rm -it -v ${PWD}:/workdir ghcr.io/nitac-info/nitac-texlive-ja:latest \
    sh -c 'latexmk -C main.tex && latexmk main.tex && latexmk -c main.tex'
```

#### Mac・Linux

```sh
docker run --rm -it -v $PWD:/workdir ghcr.io/nitac-info/nitac-texlive-ja:latest \
    sh -c 'latexmk -C main.tex && latexmk main.tex && latexmk -c main.tex'
```

## コントリビュートについて

バグ修正は歓迎します．

機能を追加したい場合は、このイメージを基に拡張したイメージを作ることができます．

詳しくは [dockerイメージをカスタマイズする](https://github.com/nitac-info/nitac-graduation-thesis-template#docker-%E3%82%A4%E3%83%A1%E3%83%BC%E3%82%B8%E3%82%92%E3%82%AB%E3%82%B9%E3%82%BF%E3%83%9E%E3%82%A4%E3%82%BA%E3%81%99%E3%82%8B) を参照してください．

## ライセンス

MIT (c) National Institute of Technology, Anan College. Infomation Course.