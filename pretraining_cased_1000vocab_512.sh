#export BERT_BASE_DIR=gs://deep_speech_bucket/multi_cased_L-12_H-768_A-12
export vocab=/home/maggie/bert/vocab/vocab_bert1000.txt
vocab=/home/maggie/bert/vocab/vocab_bert1000.txt

#python run_pretraining.py --input_file=/home/maggie/bert/tfrecord_lists/dewiki_new_cased_vocab_128_train.csv --output_dir=gs://deep_speech_bucket/bert_checkpoints/cased_1000vocab/ --do_train=True --do_eval=True --bert_config_file=/home/maggie/bert/config/bert_config.json --train_batch_size=128 --max_seq_length=128 --max_predictions_per_seq=20 --num_train_steps=4070000 --num_warmup_steps=407000 --learning_rate=1e-4 --use_tpu=True --tpu_name=$TPU_NAME --tpu_zone=us-central1-f --save_checkpoints_steps=50

python run_pretraining.py --input_file=/home/maggie/bert/tfrecord_lists/dewiki_new_cased_vocab_512_train.csv --output_dir=gs://deep_speech_bucket/bert_checkpoints/cased_1000vocab/ --do_train=True --do_eval=True --bert_config_file=/home/maggie/bert/config/bert_config.json --train_batch_size=128 --max_seq_length=512 --max_predictions_per_seq=77 --num_train_steps=2031250 --num_warmup_steps=203125 --learning_rate=2e-5 --use_tpu=True --tpu_name=$TPU_NAME --tpu_zone=us-central1-f
