python3 /home/maggie/bert/articles_classifier.py \
--data_dir=gs://deep_speech_bucket/articles/ \
--bert_config_file=/home/maggie/bert/config/bert_config_uncased.json \
--vocab_file=/home/maggie/bert/vocab/vocab_uncased_1000.txt \
--output_dir=gs://deep_speech_bucket/finetuning_articles/ \
--do_lower_case=True \
--do_train=True \
--do_eval=True \
--do_predict=True \
--use_tpu=True \
--tpu_name=$TPU_NAME \
--init_checkpoint=gs://deep_speech_bucket/my_uncased_model