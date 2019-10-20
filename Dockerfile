# Start with our cuda-ubuntu image
FROM unlhcc/cuda-ubuntu:10.0

RUN apt-get -qq update

RUN apt-get -qq install software-properties-common -y

RUN add-apt-repository ppa:jonathonf/python-3.6 -y

# Install both 2.7/3.5 version of Python and pip
RUN apt-get -qq update && \
    apt-add-repository multiverse && apt-get -qq update && \
    apt-get install -y libcupti-dev python-pip python-dev python3.6-dev python3.6 curl git

RUN curl https://bootstrap.pypa.io/get-pip.py | python3.6


# RUN pip --no-cache-dir install 'torchvision==0.4.0' 'torch==1.2.0' 'numpy<=1.16.5' 'scipy<1.3.0' 'matplotlib<3.0' 'pandas<=0.24.2' 'scikit-learn<=0.20' 'scikit-image<0.15' typing 'networkx==2.0'
RUN pip3.6 --no-cache-dir install 'torchvision==0.4.0' 'torch==1.2.0' numpy scipy 'matplotlib<3.1' pandas scikit-learn scikit-image 'networkx==2.0'

# Install Torchnet, a high-level framework for PyTorch
RUN pip3.6 install torchnet==0.0.4

# install torchtext
#RUN pip --no-cache-dir  install torchtext tensorboardx tensorboard tqdm spacy scipy scikit-learn pandas numpy nltk
RUN pip3.6 --no-cache-dir  install torchtext tensorboardx tensorboard tqdm spacy scipy scikit-learn pandas numpy nltk
RUN pip --no-cache-dir  install future

# install spacy dict
RUN python3.6 -m spacy download en

