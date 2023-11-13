# PIPE-4519-omia-phene-tagger

The aim of this project is to implement an automatic tagger
for OMIA that can scan a section of text (e.g. 1-2 paragraphs
from an article) and identify phenes that are mentioned in it,
using the [Mammalian Phenotype Ontology](https://www.ebi.ac.uk/ols4/ontologies/mp)

The model will be based on PhenoTagger, which was initially developed/trained
using the Human Phenotype Ontology. A few versions of PhenoTagger
are available on GitHub:

* Version 1.1: https://github.com/ncbi-nlp/PhenoTagger
* Version 1.2: https://github.com/DUTIR-BioNLP/PhenoTagger-Updates (looks like
  the same version that is up on [HuggingFace](https://huggingface.co/lingbionlp/PhenoTagger_v1.2))
  * Live demo here: https://huggingface.co/spaces/lingbionlp/PhenoTagger_v1.2_Demo (not working right now?)

## Original phenotagger code:

For now, the original phenotagger code has been included as a git submodule under
`phenotagger/`. This should allow us to pull in any updates from the original repo
if needed.

## Downloading MPO

MPO should be available in OBO format via http://purl.obolibrary.org/obo/mp.obo -
this link should point to the latest release of MPO.

The `download_mpo.sh` script downloads this file and saves it to `data/mp.obo`

## Rough plan/architecture

* The code from phenotagger can probably be adapted for our purposes - but from an
  initial inspection, it looks like at least some of it needs rewriting - allow
  time for this
* The inference process for the model should be implemented as a web endpoint,
  using, something like [BentoML](https://github.com/bentoml/BentoML). We do
  not want to pile more code/complexity on top of the existing OMIA app at this
  point. A separate app that communicates via web requests means we can potentially
  move it to a different server (or even cloud hosting) if the resource demands
  are too high
