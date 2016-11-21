#!/bin/bash
for i in *.mp4
do
	nome="${i/.mp4/.mp3}"
	echo $nome
	avconv -i $i -vn  $nome
done
