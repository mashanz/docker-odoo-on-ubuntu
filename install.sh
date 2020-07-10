# If you have to install from pip and using Odoo >= 11.0
sudo apt-get update -y
sudo apt install software-properties-common -y
sudo add-apt-repository universe -y
sudo apt-get update -y
sudo apt-get upgrade -y

# PYTHON
sudo apt-get install python3 python3-pip python3-suds -y
sudo apt-get install wget git bzr python-pip gdebi-core -y
sudo apt-get install libxml2-dev libxslt1-dev zlib1g-dev -y
sudo apt-get install libsasl2-dev libldap2-dev libssl-dev -y
sudo apt-get install python-pypdf2 python-dateutil python-feedparser \
    python-ldap python-libxslt1 python-lxml python-mako \
    python-openid python-psycopg2 python-babel python-pychart \
    python-pydot python-pyparsing python-reportlab \
    python-simplejson python-tz python-vatnumber \
    python-vobject python-webdav python-werkzeug python-xlwt \
    python-yaml python-zsi python-docutils python-psutil \
    python-mock python-unittest2 python-jinja2 python-pypdf \
    python-decorator python-requests python-passlib python-pil -y

# PIP
sudo pip3 install Babel==2.3.4  chardet==3.0.4 decorator==4.0.10  docutils==0.12 ebaysdk==2.1.5 feedparser==5.2.1 gevent==1.3.4  greenlet==0.4.13 html2text==2016.9.19 Jinja2==2.10.1 libsass==0.12.3  lxml==4.2.3 Mako==1.0.4 MarkupSafe==0.23 mock==2.0.0 num2words==0.5.6  ofxparse==0.16 passlib==1.6.5 Pillow==4.0.0 polib==1.1.0 psutil==4.3.1 psycopg2==2.7.3.1  pydot==1.2.3 pyparsing==2.1.10 PyPDF2==1.26.0 pyserial==3.1.1 python-dateutil==2.5.3 pytz==2016.7  pyusb==1.0.0 qrcode==5.3 reportlab==3.3.0 requests==2.20.0 zeep==3.1.0 vatnumber==1.2 vobject==0.9.3  Werkzeug==0.14.1 XlsxWriter==0.9.3 xlwt==1.3.* xlrd==1.0.0

# OTHER 
sudo apt-get install node-clean-css -y
sudo apt-get install node-less -y
sudo apt-get install python-gevent -y


# PIPEDRIVE
sudo python3 -m pip install wheel
sudo python3 -m pip install pipedrive-python-lib

# LOG
sudo mkdir /var/log/odoo
sudo chown odoo:odoo /var/log/odoo

# clone odoo
sudo apt-get install git -y
sudo git clone --depth 1 --branch 13.0 https://www.github.com/odoo/odoo /odoo/odoo-server

# CHOWN
sudo chown -R odoo:odoo /odoo/*

# MODIFY
sudo touch /etc/odoo-server.conf
sudo su root -c "printf '[options] \n; This is the password that allows database operations:\n' >> /etc/odoo-server.conf"
sudo su root -c "printf 'admin_passwd = admin\n' >> /etc/odoo-server.conf"
sudo su root -c "printf 'xmlrpc_port = 8069\n' >> /etc/odoo-server.conf"
sudo su root -c "printf 'logfile = /var/log/odoo/odoo-server.log\n' >> /etc/odoo-server.conf"
sudo su root -c "printf 'addons_path=/odoo/odoo-server/addons\n' >> /etc/odoo-server.conf"
sudo chown odoo:odoo /etc/odoo-server.conf
sudo chmod 640 /etc/odoo-server.conf

# WKHTML
sudo apt-get install wget -y
sudo wget https://builds.wkhtmltopdf.org/0.12.1.3/wkhtmltox_0.12.1.3-1~bionic_amd64.deb
sudo apt-get install ./wkhtmltox_0.12.1.3-1~bionic_amd64.deb -y
sudo apt-get install -f
sudo ln -s /usr/local/bin/wkhtmltopdf /usr/bin
sudo ln -s /usr/local/bin/wkhtmltoimage /usr/bin


# sudo SERVER
# sudo cd /odoo/odoo-server 
# sudo ./odoo-bin -c /etc/odoo-server.conf 

# ADD USER
# sudo adduser --system --quiet --shell=/bin/bash --home=/home/odoo --gecos 'ODOO' --group odoo

# ADD POSTGREES
# sudo apt-get install postgresql -y

# USER
# sudo su - postgres -c "createuser -s odoo" 2> /dev/null || true
