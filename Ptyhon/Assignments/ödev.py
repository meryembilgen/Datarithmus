def main():
    not_defteri = {}

    while True:
        giris = input("Öğrenci numarası ve not girin, 'q' ile çıkın, 'all' ile tümünü görüntüleyin, 'print OgrenciNo' ile tüm notları görüntüleyin: ")

        if giris == 'q':
            print("Program sonlandırılıyor...")
            break
        
        elif giris == 'all':
            if not not_defteri:
                print("Kayıtlı öğrenci yok.")
            else:
                for ogrenci_no, notlar in not_defteri.items():
                    print(f"{ogrenci_no} nolu öğrencinin tüm notları = {notlar}")

        elif giris.startswith("print"):
            try:
                _, ogrenci_no = giris.split()
                if ogrenci_no in not_defteri:
                    print(f"{ogrenci_no} nolu öğrencinin tüm notları = {not_defteri[ogrenci_no]}")
                else:
                    print(f"{ogrenci_no} nolu öğrenci bulunamadı.")
            except ValueError:
                print("Yanlış komut. 'print OgrenciNo' şeklinde girmelisiniz.")
        
        else:
            try:
                ogrenci_no, notu = giris.split()
                notu = int(notu)

                if ogrenci_no in not_defteri:
                    not_defteri[ogrenci_no].append(notu)
                else:
                    not_defteri[ogrenci_no] = [notu]

                print(f"{ogrenci_no} nolu öğrencinin tüm notları = {not_defteri[ogrenci_no]}")
            except ValueError:
                print("Yanlış giriş. Örnek: 123 50")

if __name__ == "__main__":
    main()
