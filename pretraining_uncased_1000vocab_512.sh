export vocab=/home/maggie/bert/vocab_uncased_1000.txt
vocab=/home/maggie/bert/vocab/vocab_uncased_1000.txt


#python run_pretraining.py --input_file=/home/maggie/bert/tfrecord_lists/dewiki_new_uncased_vocab_512_train.csv --output_dir=gs://deep_speech_bucket/bert_checkpoints/uncased_1000_vocab/ --do_train=True --do_eval=True --bert_config_file=/home/maggie/bert/config/bert_config_uncased.json --train_batch_size=256 --max_seq_length=512 --max_predictions_per_seq=77 --num_train_steps=1015625 --num_warmup_steps=101562 --learning_rate=1e-4 --use_tpu=True --tpu_name=$TPU_NAME --tpu_zone=us-central1-f

python run_pretraining.py --input_file=/home/maggie/bert/tfrecord_lists/dewiki_new_cased_vocab_512_train.csv --output_dir=gs://deep_speech_bucket/bert_checkpoints/uncased_1000_vocab/ --do_train=True --do_eval=True --bert_config_file=/home/maggie/bert/config/bert_config_uncased.json --train_batch_size=256 --max_seq_length=512 --max_predictions_per_seq=77 --num_train_steps=1015625 --num_warmup_steps=101562 --learning_rate=1e-4 --use_tpu=True --tpu_name=$TPU_NAME --tpu_zone=us-central1-f
