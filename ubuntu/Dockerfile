FROM ubuntu:18.04

RUN apt-get update && \
    apt-get -y install sudo apt-utils

RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker

# this is where I was running into problems with the other approaches
RUN sudo DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN sudo apt-get update -y
RUN sudo apt install software-properties-common -y
RUN sudo add-apt-repository universe -y
RUN sudo apt-get update -y
RUN sudo apt-get upgrade -y

RUN sudo apt-get install nano -y
RUN sudo apt-get install python3 -y
RUN sudo apt-get install python3-pip -y
RUN sudo apt-get install python3-suds -y
RUN sudo apt-get install wget -y
RUN sudo apt-get install git -y
RUN sudo apt-get install bzr -y
RUN sudo apt-get install python-pip -y
RUN sudo apt-get install gdebi-core -y
RUN sudo apt-get install libxml2-dev -y
RUN sudo apt-get install libxslt1-dev -y
RUN sudo apt-get install zlib1g-dev -y
RUN sudo apt-get install libsasl2-dev -y
RUN sudo apt-get install libldap2-dev -y
RUN sudo apt-get install libssl-dev -y
RUN sudo apt-get install python-pypdf2 -y
RUN sudo apt-get install python-dateutil -y
RUN sudo apt-get install python-feedparser -y
RUN sudo apt-get install python-ldap -y
RUN sudo apt-get install python-libxslt1 -y
RUN sudo apt-get install python-lxml -y
RUN sudo apt-get install python-mako -y
RUN sudo apt-get install python-openid -y
RUN sudo apt-get install python-psycopg2 -y
RUN sudo apt-get install python-babel -y
RUN sudo apt-get install python-pychart -y
RUN sudo apt-get install python-pydot -y
RUN sudo apt-get install python-pyparsing -y
RUN sudo apt-get install python-reportlab -y
RUN sudo apt-get install python-simplejson -y
RUN sudo apt-get install python-tz -y
RUN sudo apt-get install python-vatnumber -y
RUN sudo apt-get install python-vobject -y
RUN sudo apt-get install python-webdav -y
RUN sudo apt-get install python-werkzeug -y
RUN sudo apt-get install python-xlwt -y
RUN sudo apt-get install python-yaml -y
RUN sudo apt-get install python-zsi -y
RUN sudo apt-get install python-docutils -y
RUN sudo apt-get install python-psutil -y
RUN sudo apt-get install python-mock -y
RUN sudo apt-get install python-unittest2 -y
RUN sudo apt-get install python-jinja2 -y
RUN sudo apt-get install python-decorator -y
RUN sudo apt-get install python-requests -y
RUN sudo apt-get install python-passlib -y
RUN sudo apt-get install python-pil -y
RUN sudo apt-get install node-clean-css -y
RUN sudo apt-get install node-less -y
RUN sudo apt-get install python-gevent -y
RUN sudo apt-get install postgresql -y

RUN sudo python3 -m pip install \
    Babel==2.3.4  \
    chardet==3.0.4 \
    decorator==4.0.10 \
    docutils==0.12 \
    ebaysdk==2.1.5 \
    feedparser==5.2.1 \
    gevent==1.3.4 \
    greenlet==0.4.13 \
    html2text==2016.9.19 \
    Jinja2==2.10.1 \
    libsass==0.12.3 \
    lxml==4.2.3 \
    Mako==1.0.4 \
    MarkupSafe==0.23 \
    mock==2.0.0 \
    num2words==0.5.6 \
    ofxparse==0.16 \
    passlib==1.6.5 \
    Pillow==4.0.0 \
    pipedrive-python-lib==1.1.4 \
    polib==1.1.0 \
    psutil==4.3.1 \
    psycopg2==2.7.3.1 \
    pydot==1.2.3 \
    pyparsing==2.1.10 \
    PyPDF2==1.26.0 \
    pyserial==3.1.1 \
    python-dateutil==2.5.3 \
    pytz==2016.7 \
    pyusb==1.0.0 \
    qrcode==5.3 \
    reportlab==3.3.0 \
    requests==2.20.0 \
    zeep==3.1.0 \
    vatnumber==1.2 \
    vobject==0.9.3 \
    Werkzeug==0.14.1 \
    wheel==0.34.2 \
    XlsxWriter==0.9.3 \
    xlwt==1.3.* \
    xlrd==1.0.0

RUN sudo touch /etc/odoo-server.conf
RUN sudo su root -c "printf '[options] \n; This is the password that allows database operations:\n' >> /etc/odoo-server.conf"
RUN sudo su root -c "printf 'admin_passwd = admin\n' >> /etc/odoo-server.conf"
RUN sudo su root -c "printf 'xmlrpc_port = 8069\n' >> /etc/odoo-server.conf"
RUN sudo su root -c "printf 'logfile = /var/log/odoo/odoo-server.log\n' >> /etc/odoo-server.conf"
RUN sudo su root -c "printf 'addons_path=/odoo/odoo-server/addons\n' >> /etc/odoo-server.conf"

RUN sudo mkdir /var/log/odoo
RUN sudo mkdir /odoo/

RUN sudo adduser --system --quiet --shell=/bin/bash --home=/home/odoo --gecos 'ODOO' --group odoo

RUN sudo chown -R odoo:odoo /odoo/
RUN sudo chown odoo:odoo /var/log/odoo
RUN sudo chown odoo:odoo /etc/odoo-server.conf
RUN sudo chmod 777 /etc/odoo-server.conf