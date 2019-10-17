# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  *  Ruby 2.5.1
* System dependencies
	* n/a
* Database creation

```bash
	
    rake db:create
    rake db:migrate
    
```
 * Database initialization

 ```bash
    rake db:seed
 ```
 Will seed database with pull via REST from Discogs.com

# TuneCore Album Index
We distribute many songs and albums to iTunes and need a search interface for customer service. Please design and implement a Rails application with a search interface. Customer service should be able to search our song database by any combination of song title, album title, and artist name.

##Minimum Requirements

* 500 songs, 100 albums, 10 artists
* Return a list of songs with album and artist info
* The search should use Ajax
* Mobile responsive user interface
* Avoid using off-the-shelf search libraries and platforms, e.g. ElasticSearch, Lucene, etc.
* Avoid using database-specific functionality
* Test suite, preferably using RSpec
* Please assume that the code you submit will be deployed to production. With that in mind, write code that you believe is production ready.

###Open ended questions we can talk about when you’re here:
* What if we had 100 million songs. How might you deal with this kind of search?
* Are there refactorings that make your code easier to reason about and easier to change?


####Please upload the finished code to a publicly available repository so we can review it.
