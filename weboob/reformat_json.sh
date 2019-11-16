#!/bin/sh

tail -n 1 /weboob_output/bank.json | jq '[.[] | {id: .id,balance: .balance|tonumber}]' > /weboob_output/bank.json2
