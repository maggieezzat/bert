#!/bin/bash

export vocab=/home/maggie/bert/vocab_uncased_1000.txt
vocab=/home/maggie/bert/vocab/vocab_uncased_1000.txt


python3 /home/maggie/bert/run_pretraining.py \
--input_file=/home/maggie/bert/tfrecord_lists/dewiki_new_uncased_vocab_512_train.csv \
--output_dir=gs://deep_speech_bucket/bert_checkpoints/my_uncased_model512/ \
--init_checkpoint=gs://deep_speech_bucket/bert_checkpoints/my_uncased_model/ \
--do_train=True \
--do_eval=True \
--bert_config_file=/home/maggie/bert/config/bert_config_uncased.json \
--train_batch_size=128 \
--max_seq_length=512 \
--max_predictions_per_seq=77 \
--num_train_steps=11000 \
--num_warmup_steps=100 \
--learning_rate=2e-5 \
--use_tpu=True \
--tpu_name=$TPU_NAME \
--tpu_zone=us-central1-f
