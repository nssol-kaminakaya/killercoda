echo "セットアップ中です。しばらくおまちください..."
while [ ! -f /tmp/finished ]; do sleep 1; done
source ~/.bashrc
echo DONE