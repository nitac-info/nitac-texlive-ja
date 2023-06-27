FROM paperist/texlive-ja:latest

RUN apt-get update \
  && apt-get install -y \
    make \
    cmake

# newtx, latexindent のインストール
RUN tlmgr option repository ctan
RUN tlmgr update --self
RUN tlmgr install \
  newtx \
  fontaxes \
  boondox \
  txfonts \
  helvetic \
  latexindent

RUN cpan install Bundle::CPAN \
  && cpan reload CPAN \
  && cpan Log::Log4perl \
  && cpan YAML/Tiny.pm \
  && cpan Log::Dispatch::File \
  && cpan File::HomeDir \
  && cpan Unicode::GCString

# latexindentの設定
RUN sed -i -e 's/indentAfterThisHeading: 0/indentAfterThisHeading: 1/' \
  /usr/local/texlive/2023/texmf-dist/scripts/latexindent/defaultSettings.yaml
RUN sed -i -e 's/onlyOneBackUp: 0/onlyOneBackUp: 1/' \
  /usr/local/texlive/2023/texmf-dist/scripts/latexindent/defaultSettings.yaml

RUN apt-get install ghostscript git -y \
  && tlmgr update --self
RUN  apt-get clean \
    && rm -rf /var/lib/apt/lists/*
