python omia_tagger/train_phenotagger.py \
  --trainfile data/distant_train_data/distant_train.conll \
  --modeltype biobert \
  --output trained_model/biobert/ \
  --vocab_dir data/mpo_dict/ \
  --epochs 2