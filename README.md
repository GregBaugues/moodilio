== README

All of the settings are stored in ```/config/settings.yml```.
```
cd config
cp settings.yml.template settings.yml
```

Fill in the settings for your account and phone number. The admin number is in the number that will connect a user to if you click the *call* button.

This app uses *postgres*. I like the [postgresapp.com](http://postgresapp.com).

Standard rails setup needed. This probably isn't exhaustive, but off the top of my head:

```
echo "moodilio" > .ruby-gemset
echo "2.0.0" > .ruby-version
rake db:create
rake db:migrate

#not sure why this doesn't happen automatically, but it wasn't for me
rake db:migrate RAILS_ENV=test
```

Twilio folk use [ngrok](https://ngrok.com/) to provide a tunnel to my local machine for development purposes. Let's me do things like set the endpoints to ```http://moodilio.ngrok.com/sms``` which routes to my ```localhost:3000``` instead of needing to deploy to, say, heroku every time I want to test a change.

There are a few tests which currently pass. To run:
```rspec spec```

