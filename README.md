# backend-interview-time-tracker


## Instaltion

```language
  install rvm
  rvm use 2.6.5@time-tracker --create || rvm use 2.6.5@time-tracker 
  gem install bundler 
  bundle install
```

- copy .env.example .env

### Database
 - rake db:create
 - rake db:migrate
 - rake db:seed
 

### Running tests
  - Run migrations for test database 
    `RACK_ENV=test rake db:migrate`
  - Run tests
    `rspec spec/models/time_segment.spec.rb`


- ruby app.rb
