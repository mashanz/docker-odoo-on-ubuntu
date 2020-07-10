# docker-odoo-on-ubuntu

Odoo 13 in Ubuntu 18.04 Docker with wkhtml 0.12.1.3

## 1. Clone Repo with Modules

```sh
git clone --recurse-submodules https://github.com/mashanz/docker-odoo-on-ubuntu.git
```

## 2. run docker

```sh
cd docker-odoo-on-ubuntu
docker-compose up --build -d
```

## 3. login to running container

```
docker exec -it odoo-on-ubuntu /bin/bash
```

## 4. install requerement (inside container shell)

```sh
sh ./install.sh
```

> <b>notes</b>:<br> Put <i>123456</i> if asked to prompt password.

## Run modules (inside container shell)

```sh
cd /odoo/odoo-server/
./odoo-bin -c /etc/odoo-server.conf -r "odoo" -w "123456" --db_host "127.0.0.1" --limit-time-real=0 -s
```
