FROM gcc:bullseye

WORKDIR /usr/src/app


#############################################################################################

RUN apt update

RUN apt install git -y
RUN apt install gcc -y
RUN apt install gcc -y
RUN apt install g++ -y
RUN apt install cmake -y

RUN apt install libjsoncpp-dev -y 

RUN apt install uuid-dev -y 

RUN apt install openssl -y 
RUN apt install libssl-dev -y 

RUN apt install zlib1g-dev -y


############################################################################################

RUN git clone https://github.com/drogonframework/drogon

WORKDIR /usr/src/app/drogon

RUN git submodule update --init

RUN mkdir build

WORKDIR /usr/src/app/drogon/build

RUN cmake ..
    
RUN make 
    
RUN make install

EXPOSE 8080


#################################################################











WORKDIR /usr/src/app


COPY ./src . 

COPY CMakeLists.txt .

RUN apt update

RUN apt install cmake -y 

WORKDIR /usr/src/app/build

RUN cmake ..

RUN make

CMD [ "./F90-TESTES" ]


#docker build --progress=plain --no-cache -t f90-testes . && docker run --rm f90-testesdocker build --progress=plain --no-cache -t f90-testes . && docker run --rm f90-testes