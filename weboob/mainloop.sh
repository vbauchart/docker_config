if [ ! -r /home/vincent/encfs_mount/weboob/pass.txt ];then
	echo "WARNING: pass file is not unlocked!!"
	exit 1
fi

#while true;
#do
#	echo ls
#	sleep 10
#done | boobank --auto-update -f json -O /weboob_output/bank.json

while true;
do
	export PYTHONIOENCODING="utf-8"
	#boobank --auto-update -f json ls | jq '[.[] | {id: .id,balance: .balance|tonumber}]' > /weboob_output/bank.json2
	boobank -f json ls | jq '[.[] | {id: .id,balance: .balance|tonumber}]' > /weboob_output/bank.json2
	date
	sleep 3h
done
