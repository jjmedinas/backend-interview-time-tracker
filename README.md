# backend-interview-time-tracker

### Implemented features (User perspective)

This is an API that allows users to tack the time spent working on a given project.
It provides two features:
  - A timer to track the time 
  - A reports section where you can check all relevant data

### Implemented features (Tech perspective)
This project was created following a OOP approach. The following clases were created:
- Project: It encapsaltes the logic related to the project like name and identifier.
- TimeSegment: It's the timer, it is used to know how much time a user has spent working. A project can have many time segments.

Along with the following services:
- General Report: Service used to create a report for all reports.
- Single Project Report: Service used to create a report for an specific project.


### Instaltion

- Prerequisites
  - rvm
  - ruby 2.5.6

- Instalation steps
```language
  rvm use 2.6.5@time-tracker --create
  rvm use 2.6.5@time-tracker // if the gemset already exists 
  gem install bundler 
  bundle install
  copy .env.example .env
  ruby app.rb
```


### Setup Database
 - rake db:create
 - rake db:migrate
 - rake db:seed
 

### Running tests
  - Run migrations for test database 
    `RACK_ENV=test rake db:migrate`
  - Run tests
    `rspec spec/models/time_segment.spec.rb`

### Endpoints description 
The endpoint documentation can be found here. https://app.swaggerhub.com/apis/jjmedinas/backend-interview-time-tracker/1.0.0
