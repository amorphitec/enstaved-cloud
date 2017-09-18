# enstaved-cloud
Enstaved cloud hosting

## Mail

* [Account creation](https://github.com/tomav/docker-mailserver/wiki/Configure-Accounts)

## Shop / Devshop

Post-deployment:

```
python manage.py migrate
python manage.py collectstatic
python manage.py createsuperuser --email <user>@enstaved.com
```

## ToDo

* Proper CI for shop/devshop
* Replace `links` with docker networks
* Singular mysql
