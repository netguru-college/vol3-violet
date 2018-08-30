# Split Guru - NCC 3rd edition 2018

Hello from Violet team. We are: **Tomek**, **Kuba**, **Mikołaj**, **Thu** and our **super cool coaches** from Netguru Code College.

When you’re out with your friends, splitting the bill can get complicated. Do you divide the cost evenly or itemize everyone’s drinks and entrées? How much should each person chip in for the tip? And splitting larger bills—like rent, utilities, travel expenses can add even more complexity.

Well, we’ve got some good news: SplitGuru keeps a running balance of who owes who what and integrate with your contacts to send notifications and reminders to your friends. It splits the bills you share with friends, tells you how much you owe to each of them, and allows you to pay from your prepaid account on the app or settle with cash in real life. SplitGuru is born to make your life easier and make your friendship last longer :)

![welcome_view](/app/assets/images/readme.png)

## Features
* Create bills for many groups
* Split bills with many options
* Calculate the debt each member owes the bill-payer
* Settle the debt from prepaid account
* Remind friends about unsettled debt: sms or notification

## System dependencies
* Ruby 2.5.1
* Rails 5.2.0
* PostgreSQL

- `gem 'cancancan', '~> 2.0'`
- `gem 'carrierwave', '~> 1.0'`
- `gem 'bootstrap', '~> 4.1.3'`
- `gem 'devise'`
- `gem 'devise_invitable', '~> 1.7.0'`
- `gem 'faker'`
- `gem 'letter_opener'`
- `gem 'pry', '~> 0.11.3'`
- `gem 'pry-rails', '~> 0.3.6'`
- `gem 'shoulda-matchers',	'~>	3.1'`
- `gem 'will_paginate', '~> 3.1.0'`

* Configuration
`bundle install`

* Database creation
`rails db:setup`

* Database initialization
`rails db:migrate`

* Find SplitGuru [here]!(https://nccappviolet.herokuapp.com/)
