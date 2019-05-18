#!/bin/bash

[ -d /home/maggie/tfrecords ] || mkdir /home/maggie/tfrecords


file=/home/maggie/pretraining_articles.txt
out=/home/maggie/pretraining_articles.tfrecord
vocab=/home/maggie/bert/vocab/vocab_uncased_1000.txt

echo $out
echo $vocab


python3 /home/maggie/bert/create_pretraining_data.py --input_file="$file" --output_file=$out --vocab_file=$vocab --do_lower_case=True --max_seq_length=512 --max_predictions_per_seq=77 --masked_lm_prob=0.15 --random_seed=12345 --dupe_factor=5

