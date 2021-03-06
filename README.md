stapeluberlauf
==============
### /ˈʃtaːpl̩ ˈyːbɐˌlaʊ̯f/ _noun_, german word for stack overflow

[![Build Status](http://img.shields.io/travis/mrackwitz/stapeluberlauf/master.svg?style=flat)](https://travis-ci.org/mrackwitz/stapeluberlauf)
[![Gem Version](http://img.shields.io/gem/v/stapeluberlauf.svg?style=flat)](http://badge.fury.io/rb/stapeluberlauf)
[![Code Climate](http://img.shields.io/codeclimate/github/mrackwitz/stapeluberlauf.svg?style=flat)](https://codeclimate.com/github/mrackwitz/stapeluberlauf)

This gem provides a light-weight API wrapper to access the StackExchange API a little more conveniently.

It consists mainly out of simple DSL, which allows to describe requests and abstracts the implementation of basic
concepts like filters and paging.

It supports authenticated requests and is aware when a request requires authorization, so that it can fail preemptive
if this is not provided without a round-trip to the API.

It does provide a simple model for the response wrapper. But this covers just a primitive mapping of the JSON attributes
used for further communication negotiation. These include error indication, paging and rate limiting (quota).

It doesn't provide wrappers for the retrieved model classes yet. These have to be accessed through the envelope as raw
hashes.

## Usage

This example fetches the first 10 unanswered questions tagged as `ruby`.

```ruby
stackoverflow = Stapeluberlauf.site('stackoverflow').use_filter('withbody')
questions = stackoverflow.questions(tagged: 'ruby').unanswered.execute
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stapeluberlauf'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stapeluberlauf

## Disclaimer

This is not an official gem by StackExchange / StackOverflow.
