I=2
while [ $I -gt 0 ]
do
  sleep 1
  echo $I
  I=$(($I-1));
done
