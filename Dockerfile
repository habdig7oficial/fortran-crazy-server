FROM gcc:bullseye

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