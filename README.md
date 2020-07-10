# docker-odoo-on-ubuntu

Odoo 13 in Ubuntu 18.04 Docker with wkhtml 0.12.1.3

## Clone Repo with Modules

```
git clone --recurse-submodules https://github.com/mashanz/docker-odoo-on-ubuntu.git
```

## Run modules

```
./odoo-bin -c /etc/odoo-server.conf -r "odoo" -w "123456" --db_host "127.0.0.1" --limit-time-real=0 -s
```
