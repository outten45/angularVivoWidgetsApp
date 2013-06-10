## Angularjs / VIVO Widgets Example

A start to using [AngularJS](http://angularjs.org/) to create a site
from the JSONP feeds from [VIVO
Widgets](https://github.com/OIT-ADS-Web/vivo_widgets).  Since most of
the web is now using [Twitter
Bootstrop](http://twitter.github.io/bootstrap/), which is a really
good choice, I decided to try [Pure](http://purecss.io/).  

The initial start to this project was generated with
[Yeoman](http://yeoman.io/). [Yeoman](http://yeoman.io/) was also used
for generating angular code.

## Getting Started

You must have [nodejs](http://nodejs.org/) installed and then run the
following to install yeoman, brower and grunt.

    $ npm install -g yo grunt-cli bower

Next, install the other npm packages:

    $ npm install

Once you have done that install, you need to install the bower
dependencies by running:

    $ bower install

After running that, you should be able to run the build in server:

    $ grunt server

This might automatically open your browser, but if not, navigate to
[http://localhost:9000/](http://localhost:9000/).

You could build a static optimized version by doing:

    $ grunt build

This will create a static build in ```dist``` directory.

