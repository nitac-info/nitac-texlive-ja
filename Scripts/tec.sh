#!/bin/zsh

if [ $# -ne 1 ]; then
  echo "指定された引数は$#個です。" 1>&2
  echo "実行するには1個の引数が必要です。" 1>&2
  exit 1
fi

file_name=${1}
docker run --rm -v $PWD:/workdir texlive-ja-add-newtx uplatex $1
dvi_file=(${file_name//.tex/}".dvi")
if [ -e $dvi_file ]; then
  echo "古いPDFファイルを削除します"
  rm -f ${file_name//.tex/}".pdf"
  docker run --rm -v $PWD:/workdir texlive-ja-add-newtx dvipdfmx $dvi_file
  if [ -e ${file_name//.tex/}".pdf" ]; then
    echo "一時ファイルを削除します"
    rm -f $dvi_file
    rm -f ${file_name//.tex/}".log"
    rm -f ${file_name//.tex/}".aux"
  fi
else
  echo "DVIファイルが存在しません."
fi
