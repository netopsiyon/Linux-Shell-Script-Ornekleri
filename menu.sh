#!/bin/bash

echo "Merhaba, adınız nedir?"
read ad
echo "Hoşgeldin , $ad"


# Kullanıcıdan işlem seçmesini istiyoruz.
echo "Lütfen yapmak istediğiniz işlemi seçiniz"
echo "1. Dosya oluştur"
echo "2. Dosya sil"
echo "3. Çıkış"

# Kullanıcıdan seçtiği işlemi oku
read secim

case $secim in
    1)
    echo "Oluşturmak istediğiniz dosyanın adını giriniz"
    read dosyaadi
    touch $dosyaadi
    echo "$dosyaadi oluşturuldu!"
    ;;
    2)
    echo  "Silmek istediğiniz dosya adını giriniz"
    read dosyaadi
    rm -f $dosyaadi
    echo "$dosyaadi silindi!"
    ;;
    3)
    echo "Programdan çıkıyorum...."
    exit 0
    ;;
    *)
    echo "Geçersiz seçim. Lütfen 1,2 veya 3 seçiniz"
    ;;
esac
