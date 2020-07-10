# If you have to install from pip and using Odoo >= 11.0
sudo apt-get update -y
sudo apt install software-properties-common -y
sudo add-apt-repository universe -y
sudo apt-get update -y
sudo apt-get upgrade -y

# PYTHON
sudo apt-get install nano python3 python3-pip python3-suds \
    wget git bzr python-pip gdebi-core \
    libxml2-dev libxslt1-dev zlib1g-dev \
    libsasl2-dev libldap2-dev libssl-dev \
    python-pypdf2 python-dateutil python-feedparser \
    python-ldap python-libxslt1 python-lxml python-mako \
    python-openid python-psycopg2 python-babel python-pychart \
    python-pydot python-pyparsing python-reportlab \
    python-simplejson python-tz python-vatnumber \
    python-vobject python-webdav python-werkzeug python-xlwt \
    python-yaml python-zsi python-docutils python-psutil \
    python-mock python-unittest2 python-jinja2 \
    python-decorator python-requests python-passlib python-pil \
    node-clean-css node-less python-gevent postgresql -y

# run postgres
sudo service postgresql start

# PIP
sudo python3 -m pip install -r ./requirements.txt

# WKHTML
sudo apt-get install ./wkhtmltox_0.12.1.3-1~bionic_amd64.deb -y
sudo apt-get install -f
sudo ln -s /usr/local/bin/wkhtmltopdf /usr/bin
sudo ln -s /usr/local/bin/wkhtmltoimage /usr/bin

# MODIFY
sudo touch /etc/odoo-server.conf
sudo su root -c "printf '[options] \n; This is the password that allows database operations:\n' >> /etc/odoo-server.conf"
sudo su root -c "printf 'admin_passwd = admin\n' >> /etc/odoo-server.conf"
sudo su root -c "printf 'xmlrpc_port = 8069\n' >> /etc/odoo-server.conf"
sudo su root -c "printf 'logfile = /var/log/odoo/odoo-server.log\n' >> /etc/odoo-server.conf"
sudo su root -c "printf 'addons_path=/odoo/odoo-server/addons\n' >> /etc/odoo-server.conf"

# LOG
sudo mkdir /var/log/odoo

# ADD USER
sudo adduser --system --quiet --shell=/bin/bash --home=/home/odoo --gecos 'ODOO' --group odoo

# USER
sudo su - postgres -c "createuser -s odoo --interactive --pwprompt"

# CHOWN
sudo chown -R odoo:odoo /odoo/*
sudo chown odoo:odoo /var/log/odoo
sudo chown odoo:odoo /etc/odoo-server.conf
sudo chmod 640 /etc/odoo-server.conf

# sudo SERVER
sudo cd /odoo/odoo-server 
./odoo-bin -c /etc/odoo-server.conf -r "odoo" -w "123456" --db_host "127.0.0.1" --limit-time-real=0 -s
