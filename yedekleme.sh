#!/bin/bash

    if [ -z $1 ]; then
        user=$(whoami)
    else
        if [ ! -d "/home/$1" ]; then
        echo "$1 klasörü mevcut değil"
        exit 1
        fi
    user=$1
    fi

    input=/home/$user
    out=/tmp/${user}_yedek_$(date +%Y-%m-%d_%H%M%S).tar.gz

    function toplam_dosya {
        find $1 -type f | wc -l
    }
    function toplam_dizin {
        find $1 -type d | wc -l
    }
    function toplam_arsiv_dizin {
        tar -tzf $1 | grep /$ |wc -l
    }
    function toplam_arsiv_dosya {
        tar -tzf $1 | grep -v /$ |wc -l
    }
    tar -czf  $out $input 2> /dev/null
    kaynak_dosyalar=$(toplam_dosya $input)
    kaynak_dizinler=$(toplam_dizin $input)
    kaynak_arsiv_dizin=$(toplam_arsiv_dizin $out)
    kaynak_arsiv_dosya=$(toplam_arsiv_dosya $out)
    echo "####### $user #######"
    echo "Arşiv Dosyasına $kaynak_dosyalar adet dosya eklendi"
    echo "Arşiv Dosyasına $kaynak_dizinler adet dizin eklendi"
    if [ $kaynak_dosyalar -eq $kaynak_arsiv_dosya ]; then
        echo "$input dosyaları yedeklendi"
        ls -l $out
    else
        echo "Yedekleme yapılamadı"
    fi
