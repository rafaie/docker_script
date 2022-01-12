FROM ubuntu:18.04

# Install pre-requisites
RUN apt-get update
RUN apt-get install curl wget gnupg2 zip unzip tar git  -y
# RUN apt-get install openjdk-8-jre -y

# RUN bash
# RUN curl -s "https://get.sdkman.io" | bash
# RUN bash "/root/.sdkman/bin/sdkman-init.sh" && sdk list java
# RUN bash sdk list java
# RUN sdk install java 11.0.4.hs-adpt
# RUN sdk install sbt

# Install SBT
# https://www.scala-sbt.org/1.x/docs/Installing-sbt-on-Linux.html
# RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
# RUN curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add
# RUN apt-get update
# RUN apt-get install sbt git -y

# Install OPenIE 5.0
RUN git clone https://github.com/dair-iitd/OpenIE-standalone --recursive
RUN cd OpenIE-standalone && mkdir lib
RUN cd OpenIE-standalone && wget https://github.com/dair-iitd/OpenIE-standalone/releases/download/v5.0/BONIE.jar && mv BONIE.jar lib/BONIE.jar
RUN cd OpenIE-standalone && wget https://github.com/dair-iitd/OpenIE-standalone/releases/download/v5.0/ListExtractor.jar && mv ListExtractor.jar lib/

# Download language model from google drive
RUN git clone https://github.com/circulosmeos/gdown.pl/
RUN cd gdown.pl && ./gdown.pl "https://drive.google.com/file/d/0B-5EkZMOlIt2cFdjYUJZdGxSREU/view?usp=sharing" languageModel
# RUN ls && df -h && du -hs *
RUN mv gdown.pl/languageModel OpenIE-standalone/data/ 
RUN cd ..

# RUN sbt "runMain edu.knowitall.openie.OpenIECli" -Dsbt.rootdir=true -Xmx12G -XX:+UseConcMarkSweepGC
# RUN sbt -J-Xmx10000M -Dsbt.rootdir=true clean compile assembly 
# RUN [ ! -d lib ] && mkdir lib

# RUN export PATH=/OpenIE-standalone/sbt/bin:$PATH && echo $PATH && ls /OpenIE-standalone/sbt/bin && whereis sbt
RUN apt-get install openjdk-8-jdk -y
RUN export PATH=/OpenIE-standalone/sbt/bin:$PATH && echo $PATH && cd OpenIE-standalone && sbt version
RUN export PATH=/OpenIE-standalone/sbt/bin:$PATH && echo $PATH && cd OpenIE-standalone && ./compile.sh
# RUN export PATH=/OpenIE-standalone/sbt/bin:$PATH && echo $PATH && cd OpenIE-standalone &&  sbt "runMain edu.knowitall.openie.OpenIECli" -Dsbt.rootdir=true
# RUN export PATH=/OpenIE-standalone/sbt/bin:$PATH && echo $PATH && cd OpenIE-standalone && java -jar openie-assembly.jar --httpPort 8000
EXPOSE 9000
