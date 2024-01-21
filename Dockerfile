FROM paperist/texlive-ja:latest

RUN apt-get update \
  && apt-get install -y \
    make \
    cmake \
    ghostscript \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# newtx, latexindent のインストール
RUN tlmgr option repository ctan \
  && tlmgr update --self \
  && tlmgr install \
  newtx \
  fontaxes \
  boondox \
  txfonts \
  helvetic \
  latexindent


# latexindentの設定
RUN sed -i -e 's/indentAfterThisHeading: 0/indentAfterThisHeading: 1/' \
  /usr/local/texlive/2023/texmf-dist/scripts/latexindent/defaultSettings.yaml \
  && sed -i -e 's/onlyOneBackUp: 0/onlyOneBackUp: 1/' \
  /usr/local/texlive/2023/texmf-dist/scripts/latexindent/defaultSettings.yaml


RUN apt install cpanm -y && \
  cpanm Unicode::GCString && \
  cpanm App::cpanminus && \
  cpanm YAML::Tiny && \
  perl -MCPAN -e 'install "File::HomeDir"'