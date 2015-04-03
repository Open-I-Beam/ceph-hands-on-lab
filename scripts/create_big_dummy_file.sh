rm -f dummy.bin dummy.bin2
head -c 10000000 /dev/urandom > dummy.bin
for i in {1..5}
do
   cat dummy.bin >> dummy.bin2
   cat dummy.bin2 >> dummy.bin
   echo -n .
done
echo ""
rm -f dummy.bin2
