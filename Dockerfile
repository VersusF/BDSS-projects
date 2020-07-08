FROM jupyter/tensorflow-notebook
USER root
RUN apt-get update
RUN apt install -y libtool libffi-dev ruby ruby-dev make
RUN apt install -y libzmq3-dev libczmq-dev
RUN gem install ffi-rzmq
RUN gem install iruby --pre
RUN iruby register --force
RUN gem install redis
RUN apt-get update
RUN apt-get install -y libpq-dev
RUN gem install pg
RUN gem install sequel
RUN apt-get install -y sqlite3
RUN apt-get install -y libsqlite3-dev
RUN gem install sqlite3 
RUN gem install sinatra
RUN gem install sinatra-contrib
RUN apt-get install -y libpng-dev
RUN apt-get install -y --reinstall zlibc zlib1g zlib1g-dev
RUN gem install nokogiri
RUN pip install graphviz
RUN pip install pydotplus
RUN apt install -y python-pydot python-pydot-ng graphviz
CMD jupyter notebook --allow-root --NotebookApp.token='' 