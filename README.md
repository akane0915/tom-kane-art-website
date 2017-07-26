# TOMKANEART.com

![homepage](https://user-images.githubusercontent.com/25161777/27449916-cdb3f0fa-573e-11e7-8750-951b039c1a79.png)

This a freelance website for an artist to display and sell his gallery of paintings for potentials buyers. The artist can upload additional files for listing new paintings and updating existing paintings through an administrative authentication. Features Stripe, Devise, AWS, Paperclip, and ActionMailer.

### Statement of Work
https://docs.google.com/document/d/1LYGByq_7UnubV5P1nPozUEuvJ8nnUu866HmxlpSJT9s/edit?ts=5948677c

### Prerequisites

Web browser with ES6 compatibility
Examples: Chrome, Safari

* Ruby 2.4.1
* Rails 5.1.1
* Bundler

### Installing

Clone this repo by typing into the terminal:
```
$ git clone https://github.com/akane0915/tom-kane-art-website
```

In a new terminal window, start postgres in the background:
```
$ postgres
```
Ensure you are using Ruby 2.4.1 by typing:
```
$ ruby -v
```

If you are not running version 2.4.1 please look into a Ruby version manager. We suggest RVM or Chruby.

Navigate to this project directory in the terminal. Then type:

```
$ bundle install
```

After the gems are installed set up the database:

```
$ bundle exec rails db:setup
```

To run the app:
```
$ bundle exec rails server
```
If all went well, rails will now make this project available in your browser by going to localhost:3000.

### Testing

This application includes both Unit and User Integration testing.  It primarily uses RSpec, Capybara, Shoulda-Matchers, Factory Girl, and Simple Cov.

Create an .env file at the top level of the project folder.  In the file, include (replace strings with your own API test keys):

PUBLISHABLE_KEY="Your publishable key from stripe here"
SECRET_KEY="Your secret key from stripe here"

In your terminal run:

```
$ bundle exec rails db:test:prepare
$ bundle exec rspec
```

## Screenshots

### Gallery

![gallery](https://user-images.githubusercontent.com/25161777/27449900-c28dbcba-573e-11e7-9ac5-0b3b539633c6.png)

### Hover

![hover2](https://user-images.githubusercontent.com/25161777/27460543-434c9bee-5769-11e7-9732-b0df013157e4.png)

## Authors

* Grady Shelton
* Jennifer Kinsey
* Asia Kane
* Spencer Alan

### Technologies Used

* Ruby
* Rails
* Bundler
* Postgres
* RSpec
* Javascript (ES6)
* Jquery 3
* HTML5
* SASS

### Authentication

This application uses the Devise Gem for User Authentication.

## License

MIT License

Copyright (c) 2017 Grady Shelton, Jennifer Kinsey, Asia Kane, Spencer Alan

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
