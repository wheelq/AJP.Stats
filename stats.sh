#Usage: ./stats.sh <log_file_name>
#Script takes <log_file_name> as stdin and performs some calculations on it
#
# This file needs some refactoring, but it works :)
echo '================================================================'
echo 'Maximum number of connections on to each application server was:'
sort -k8,8 -k12,12nr $1 | awk 'x!=$8{x=$8;print "-->" $10 "  " $12}'
echo '================================================================'
echo 'More details (last number is number of maximum connections'
sort -k8,8 -k12,12nr $1 | awk 'x!=$8{x=$8;print}'
echo '================================================================'
echo 'Average number of connections'
echo "--> <application name> : $(sort -k8,8 -k12,12nr $1| grep <application name> | awk '{ sum += $12 }END { print sum/NR }')"
echo '================================================================'
