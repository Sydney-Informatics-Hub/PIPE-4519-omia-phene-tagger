FROM tensorflow/tensorflow:2.14.0-gpu-jupyter

RUN pip install transformers>=4.35.0 nltk>=3.8.1 torch>=2.0
