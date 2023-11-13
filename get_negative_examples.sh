# Download zip file with data
curl https://ftp.ncbi.nlm.nih.gov/pub/lu/PhenoTagger/mutation_disease.zip -o data/mutation_disease.zip
# Unzip to data/ directory
unzip data/mutation_disease.zip -d data/
# Remove zip file
rm data/mutation_disease.zip