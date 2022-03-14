FROM ubuntu
RUN apt update  -y && apt-get upgrade -y
RUN apt install -y default-jre
RUN apt install -y git
RUN git clone https://github.com/ConsenSys/teku.git
RUN cd teku && ./gradlew installDist
EXPOSE 8008 5051 9000 9000/udp
# specify default command
ENTRYPOINT ["bash"]
