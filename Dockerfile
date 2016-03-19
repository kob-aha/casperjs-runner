FROM python:2.7.11
MAINTAINER Koby Aharon <kobyahron@gmail.com>

RUN apt-get update --fix-missing \
  && apt-get install -y build-essential g++ flex bison gperf ruby perl \
        libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
        libpng-dev libjpeg-dev wget git \
  && apt-get clean all
        
ENV PHANTOMJS_VERSION 2.1.1      

RUN wget "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2" -O /tmp/phantomjs.tar.bz2 \
    && mkdir -p /opt/phantomjs \
    && tar --strip-components=1 -xjf /tmp/phantomjs.tar.bz2 -C /opt/phantomjs           
    
RUN git clone https://github.com/n1k0/casperjs.git /opt/casperjs 

ENV CASPERJS_VERSION 1.1-beta4

RUN cd /opt/casperjs \        
    && ln -sf `pwd`/bin/casperjs /usr/bin/casperjs \
    && git checkout -b ${CASPERJS_VERSION}

RUN mkdir /home/casperjs

WORKDIR /home/casperjs
    
ENV PATH ${PATH}:/opt/phantomjs/bin  

ENTRYPOINT ["casperjs"]
CMD ["sample.js"]