# Deploying to Heroku

## Create Heroku Instance with TerraForm

Using [TerraForm](http://www.terraform.io)

Applying TerrForm Code
```
terraform apply \
-var 'heroku_email=you@example.com' \
-var 'heroku_api_key=YOUR_HEROKU_API_KEY'
```

Show state changes from current config and current infrastructure
```
terraform plan \
-var 'heroku_email=you@example.com' \
-var 'heroku_api_key=YOUR_HEROKU_API_KEY'
```

Tearing it down
```
terraform destroy \
-var 'heroku_email=you@example.com' \
-var 'heroku_api_key=YOUR_HEROKU_API_KEY'
```

## Deploy to Heroku

```
git remote add heroku git@heroku.com:{heroku-app-name}.git
```

```
heroku git:remote -a project
```

```
git push heroku master
```
