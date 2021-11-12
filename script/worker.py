#!/usr/bin/python
# -*- coding: utf-8 -*-
import commands
import json
res = {'data': []}
all_phps = commands.getoutput('ps -ax -o cmd|grep -oP ".*\.php" | sort | uniq | sort -n -r | grep -v "grep"').split("\n")

for all_php in all_phps:
	process = all_php.split(" ")[-1]
	res["data"].append({"{#WORKER_PROCESS}":str(process)})

print json.dumps(res)

