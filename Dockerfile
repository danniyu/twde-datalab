FROM ubuntu:latest

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

RUN mkdir -p /app/continuous-intelligence/src
RUN mkdir -p /app/continuous-intelligence/data

COPY src /app/continuous-intelligence/src
COPY data /app/continuous-intelligence/data
COPY requirements.txt /app/continuous-intelligence/
COPY start.sh /app/continuous-intelligence

RUN cd /app/continuous-intelligence && pip3 install -r requirements.txt

RUN chmod +x /app/continuous-intelligence/start.sh
CMD ["/app/continuous-intelligence/start.sh"]
