FROM ubuntu:16.04
# docker build -t vanessa/convert-swf .

RUN mkdir /data

RUN apt-get update && apt-get install -y git libsdl-dev \
                                             libboost-dev \
                                             libagg-dev \
                                             ffmpeg

RUN apt-get install -y autoconf build-essential libtool \
                                                gconf-2.0 \
                                                pkg-config 

RUN apt-get install -y libgconf2-dev \
                       libming-dev \ 
                       libming-util \
                       mtasc \
                       haxe \
                       swfmill \
                       swftools \
                       csound \
                       gettext \
                       dejagnu \        
                       libcurl4-openssl-dev \
                       libspeex-dev \
                       libspeexdsp-dev \
                       libfreetype6-dev \
                       libfontconfig1-dev 

RUN apt-get install -y libjpeg-dev \
                       libgif-dev \
                       ffmpeg \
                       libav-tools \
                       libavformat-dev \
                       libswscale-dev \
                       libavutil-dev \
                       libboost-dev \
                       libboost-thread-dev \
                       libboost-program-options-dev
   
RUN git clone git://git.sv.gnu.org/gnash.git
WORKDIR gnash
RUN ./autogen.sh && ./configure --enable-renderer=agg \
                                --enable-gui=dump \
                                --disable-menus \
                                --enable-media=ffmpeg \
                                --disable-jemalloc && make && make install

WORKDIR /data
ADD convert.sh /
RUN chmod u+x /convert.sh
ENTRYPOINT ["/convert.sh"]
