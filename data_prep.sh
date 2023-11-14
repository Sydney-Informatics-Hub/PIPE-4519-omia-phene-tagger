# Create a dictionary of terms from the ontology
python omia_tagger/build_dict.py \
  --input data/mp.obo \
  --output data/mpo_dict/ \
  --rootnode MP:0000001
# Build the "distantly-supervised training dataset"
#   Requires negative examples: see get_negative_examples.sh
# TODO: build_distant_corpus is finicky about paths, e.g. --dict path must end with a /
#   Same with build_dict and output folder
python omia_tagger/build_distant_corpus.py \
  --dict data/mpo_dict/ \
  --fileneg data/mutation_disease.txt \
  --negnum 10000 \
  --output data/distant_train_data/