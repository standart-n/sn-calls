#!/usr/bin/env bash
cd ./haml/
for i in $( ls *.haml );
do
	echo ${i/.haml/}.haml
	haml ${i/.haml/}.haml ../tpl/templates/${i/.haml/}.tpl
done
cd ../