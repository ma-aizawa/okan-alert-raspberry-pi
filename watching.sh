gpio=18
dulation=1
width=384
height=288

if [ ! -d /sys/class/gpio/gpio${gpio} ]; then
  value=/sys/class/gpio/gpio${gpio}/value
  prev_value=`cat $value`
fi

while :
do
  current_value=`cat ${value}`
  if [ ${prev_value} -eq 0 ]; then
    if [ ${current_value} -eq 1 ]; then
      now=`date +%Y%m%d%H%M%S`
      raspistill -o $now.jpg -w $width -h $height -t 1 -vf -hf
    fi
  fi
  prev_value=${current_value}
  sleep ${dulation}s
done

