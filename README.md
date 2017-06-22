# TOMKANEART.com

![homepage]('homepage.png')

This a website for an artist to display and sell his gallery of paintings for potentials buyers. The artist can upload additional files for listing new paintings and updating existing paintings through an administrative authentication.

### Prerequisites

Web browser with ES6 compatibility
Examples: Chrome, Safari

* Ruby 2.4.1
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

Navigate to this project directory in the terminal. Then type:
```
rails db:setup
```

In a new terminal tab, start the sinatra server by typing:
```
rails server
```
Rails will now make this project available in your browser by going to localhost:3000.

## Screenshot

![gallery]('gallery.png')


## Authors

Grady Shelton
Jennifer Kinsey
Asia Kane
Spencer Alan


## License

MIT License

Copyright (c) Grady Shelton, Jennifer Kinsey, Asia Kane, Spencer Alan

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
