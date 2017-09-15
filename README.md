# enstaved-cloud
Enstaved cloud hosting

## Mail

* [Account creation](https://github.com/tomav/docker-mailserver/wiki/Configure-Accounts)

## Shop

Post-deployment:

```
docker-compose run enstaved-shop python manage.py migrate
docker-compose run enstaved-shop python manage.py collectstatic
docker-compose run esntaved-shop python manage.py populatedb --createsuperuser
```

*The `--createsuperuser` switch creates an admin account for `admin@example.com` with the password set to `admin`.*


## ToDo

* Replace `links` with docker networks
* Separate `devshop` + db
* Singular mysql
