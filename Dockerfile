FROM library/ubuntu:16.04

WORKDIR /src
RUN apt-get update \
	&& apt-get install -y libpng-dev \
		libfreetype6 libfreetype6-dev \
		python-dev \
		python-simplejson \
		python-qt4 \
		python-numpy python-scipy python-matplotlib \
		libgeos-dev \
		python-shapely \
		python-setuptools \
		python-pip \
		libspatialindex-dev \
	&& easy_install -U distribute

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . /src/.

CMD python FlatCAM.py

