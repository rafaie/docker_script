# Start with our cuda-ubuntu image
FROM unlhcc/cuda-ubuntu:11.2

RUN apt-get -qq update

RUN apt-get -qq install software-properties-common -y

RUN add-apt-repository ppa:deadsnakes/ppa -y

# Install both 2.7/3.5 version of Python and pip
RUN apt-get -qq update && \
    apt-add-repository multiverse && apt-get -qq update && \
    apt-get install -y libcupti-dev python-dev python3.8-dev python3.8 curl git python3-distutils

RUN curl https://bootstrap.pypa.io/get-pip.py | python3.8
# RUN python3.8 get-pip.py

RUN pip3.8 --no-cache-dir install torch==1.9.0+cu111 torchvision==0.10.0+cu111 torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html

RUN pip3.8 --no-cache-dir install allennlp

RUN pip3.8 --no-cache-dir install lime

RUN pip3.8 --no-cache-dir install torchtext tensorboardx tensorboard tqdm spacy scipy scikit-learn pandas numpy nltk

RUN python3.8 -m spacy download en


# # RUN pip --no-cache-dir install 'torchvision==0.4.0' 'torch==1.2.0' 'numpy<=1.16.5' 'scipy<1.3.0' 'matplotlib<3.0' 'pandas<=0.24.2' 'scikit-learn<=0.20' 'scikit-image<0.15' typing 'networkx==2.0'
# RUN pip3.6 --no-cache-dir install 'torchvision==0.4.0' 'torch==1.2.0' numpy scipy 'matplotlib<3.1' pandas scikit-learn scikit-image 'networkx==2.0'

# # Install Torchnet, a high-level framework for PyTorch
# RUN pip3.6 install torchnet==0.0.4

# # install torchtext
# #RUN pip --no-cache-dir  install torchtext tensorboardx tensorboard tqdm spacy scipy scikit-learn pandas numpy nltk
# RUN pip3.6 --no-cache-dir  install torchtext tensorboardx tensorboard tqdm spacy scipy scikit-learn pandas numpy nltk
# RUN pip --no-cache-dir  install future

# # install spacy dict
# RUN python3.6 -m spacy download en

