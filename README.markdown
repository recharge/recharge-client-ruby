# Recharge

<https://github.com/recharge/recharge-client-ruby>

[Recharge](https://rechargebilling.com/)'s Ruby client library is an interface to its
[REST API](https://rechargebilling.com/api).


## Installation

Recharge is packaged as a Ruby gem. We recommend you install it with
[Bundler](http://gembundler.com/) by adding the following line to your Gemfile:

``` ruby
gem 'Recharge', '~> 1.1.3'
```

## Configuration

Simply set your API private key (found in your Recharge API Settings) like this:

``` ruby
Recharge.api_key = "92ec4e4d8b623de9baaaf1576b7c557dd113e3f8"
```

## Usage

Instructions and examples are available on
[Recharge's documentation site](https://rechargebilling.com/api).

Full working examples are also included in the examples/ directory.


## License

(The MIT License.)

© 2012 Recharge LLC.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
