export vocab=/home/maggie/bert/vocab/vocab_cased_1000.txt
vocab=/home/maggie/bert/vocab/vocab_cased_1000.txt


python3 /home/maggie/bert/run_pretraining.py \
--input_file=/home/maggie/bert/tfrecord_lists/dewiki_new_cased_vocab_128_train.csv \
--output_dir=gs://deep_speech_bucket/bert_checkpoints/my_cased_model_128_2nd/ \
--init_checkpoint=gs://deep_speech_bucket/bert_checkpoints/my_cased_model/ \
--do_train=True \
--do_eval=True \
--bert_config_file=/home/maggie/bert/config/bert_config_cased.json \
--train_batch_size=896 \
--max_seq_length=128 \
--max_predictions_per_seq=20 \
--num_train_steps=30000 \
--num_warmup_steps=20000 \
--learning_rate=2e-5 \
--use_tpu=True \
--tpu_name=$TPU_NAME \
--tpu_zone=us-central1-f
