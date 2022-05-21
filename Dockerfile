FROM centos:7
RUN yum install python3  python3-devel   gcc-c++ -y && \
    python3 -m pip install --upgrade --force-reinstall pip && \
    yum install sudo -y && \
    yum install --assumeyes  python3-pip && \
    pip install keras && \
    pip install tensorflow --no-cache-dir  tensorflow && \
    pip install --upgrade pip tensorflow && \
    pip3 install flask && \
    pip3 install joblib && \
    pip3 install sklearn && \
    mkdir  /covid19 &&  \
    mkdir /covid19/templates
COPY ./covid-19.h5     /covid19
COPY  ./flask/app.py  /covid19
COPY  ./src/  /covid19/templates

EXPOSE  6666
WORKDIR  /covid19
CMD export FLASK_APP=app.py
ENTRYPOINT flask  run --host=0.0.0.0    --port=6666