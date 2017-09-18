# enstaved-cloud
Enstaved cloud hosting

## Mail

* [Account creation](https://github.com/tomav/docker-mailserver/wiki/Configure-Accounts)

## Shop / Devshop

Post-deployment:

```
python manage.py migrate
python manage.py collectstatic
python manage.py --createsuperuser
```

*The `--createsuperuser` switch creates an admin account for `admin@example.com` with the password set to `admin`.*

## ToDo

* Proper CI for shop/devshop
* Replace `links` with docker networks
* Singular mysql
