FROM buildpack-deps:xenial
RUN apt-get update
RUN apt-get install -y libssl-dev && wget http://ftp.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.tar.gz &&     tar -xzvf ruby-2.4.2.tar.gz &&     cd ruby-2.4.2/ &&     ./configure &&     make -j4 &&     make install &&     ruby -v
RUN wget https://nodejs.org/dist/v13.3.0/node-v13.3.0.tar.gz &&     tar -xzvf node-v13.3.0.tar.gz &&     rm node-v13.3.0.tar.gz &&     cd node-v13.3.0 &&     ./configure &&     make -j4 &&     make install &&     cd .. &&     rm -r node-v13.3.0
RUN wget https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tgz &&     tar xzf Python-3.8.0.tgz &&     rm Python-3.8.0.tgz &&     cd Python-3.8.0 &&     ./configure &&     make install
RUN git clone https://github.com/sstephenson/bats.git   && cd bats   && ./install.sh /usr/local   && cd ..   && rm -rf bats
RUN perl -MCPAN -e 'install TAP::Parser'
RUN perl -MCPAN -e 'install XML::Generator'
RUN apt-get update && apt-get -y install lsb-release unzip python3-pip python3-dev
RUN pip3 install mkdocs mkdocs-material json-spec
RUN gem install awesome_bot
CMD ["/bin/sh"]
