#!/usr/bin/env bash

gcc --version >/dev/null 2>&1
[[ $? -ne 0 ]] && echo -e "Приложение \033[0;32mgcc\033[0m не найдено" && exit 127

BuildDir="../../build"
pushd src/cpp >/dev/null 2>&1
rm -rf ${BuildDir}
mkdir ${BuildDir}
for File in $(find ./ -type f)
do
    OutFile=$(basename $File | awk -F '.' '{print $1}')
    echo -e "Компиляция \033[0;35m""$(basename ${File})""\033[0m"
    gcc ${File} -lstdc++ -o ${BuildDir}/${OutFile}
    CompileStatus=$?
    echo -ne "\033[0;35m""$(basename ${File})""\033[0m: "
    if [[ ${CompileStatus} -eq 0 ]]; then echo -e "\033[0;32mSUCCESS\033[0m"
    else echo -e "\033[0;31mFAILED\033[0m"; fi
done
popd >/dev/null 2>&1

echo -e "\033[0;33mКомпиляция завершена\033[0m"
echo -e "Скомпилированные файлы находятся в директории \033[0;34mbuild\033[0m"
