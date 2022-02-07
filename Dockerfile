FROM paperist/texlive-ja:latest

RUN apt-get update \
  && apt-get install -y \
  libfontconfig1 \
  && rm -rf /var/lib/apt/lists/*

# newtxのインストール
RUN tlmgr install newtx fontaxes boondox txfonts helvetic
