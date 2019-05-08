#!/bin/bash

[ -d /home/maggie/tfrecords ] || mkdir /home/maggie/tfrecords

#BERT_BASE_DIR=/media/maggie/Maggie/BERT/Bert-Checkpoints/Bert-Base-Multilingual-Cased/multi_cased_L-12_H-768_A-12/multi_cased_L-12_H-768_A-12

BERT_BASE_DIR=gs://deep_speech_bucket/multi_cased_L-12_H-768_A-12


csv=/home/maggie/csv_files/
out=/home/maggie/tfrecords/
#vocab=/home/maggie/vocab_bert.txt

echo $BERT_BASE_DIR
echo $csv
echo $out

for file in "$csv"*.csv; do
	filename=$(basename -- "$file")
	extension="${filename##*.}"
	filename="${filename%.*}"
	python3 /home/maggie/bert/create_pretraining_data.py --input_file="$file" --output_file="$out$filename".tfrecord --vocab_file=$BERT_BASE_DIR/vocab.txt --do_lower_case=False --max_seq_length=128 --max_predictions_per_seq=20 --masked_lm_prob=0.15 --random_seed=12345 --dupe_factor=5
done


