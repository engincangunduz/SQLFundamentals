#!/bin/bash

# Kullanıcıdan işlem operand'ını iste
echo "Yapmak istediğiniz işlemi seçin:"
echo "+ (toplama)"
echo "- (çıkarma)"
echo "* (çarpma)"
echo "/ (bölme)"
echo "% (mod)"
echo "! (faktöriyel)"
read operand

# Faktöriyel hesaplama fonksiyonu
factorial() {
  if [ $1 -le 1 ]; then
    echo 1
  else
    prev=$(factorial $(($1 - 1)))
    echo $(($1 * prev))
  fi
}

# İşlem operand'ına göre gerekli sayıları kullanıcıdan iste ve işlemi gerçekleştir
if [ "$operand" == "!" ]; then
  echo "Bir sayı girin:"
  read num
else
  echo "Birinci sayıyı girin:"
  read num1
  echo "İkinci sayıyı girin:"
  read num2
fi

# Seçilen işleme göre sonucu hesapla ve yazdır
case $operand in
  +)
    result=$(echo "$num1 + $num2" | bc)
    echo "Sonuç: $num1 + $num2 = $result"
    ;;
  -)
    result=$(echo "$num1 - $num2" | bc)
    echo "Sonuç: $num1 - $num2 = $result"
    ;;
  \*)
    result=$(echo "$num1 * $num2" | bc)
    echo "Sonuç: $num1 * $num2 = $result"
    ;;
  /)
    if [ $num2 -ne 0 ]; then
      result=$(echo "scale=2; $num1 / $num2" | bc)
      echo "Sonuç: $num1 / $num2 = $result"
    else
      echo "Hata: Sıfıra bölme işlemi yapılamaz!"
    fi
    ;;
  %)
    result=$(echo "$num1 % $num2" | bc)
    echo "Sonuç: $num1 % $num2 = $result"
    ;;
  !)
    if [ $num -ge 0 ]; then
      result=$(factorial $num)
      echo "Sonuç: $num! = $result"
    else
      echo "Hata: Faktöriyel sadece pozitif tamsayılar için hesaplanabilir!"
    fi
    ;;
  *)
    echo "Geçersiz işlem seçimi."
    ;;
esac
