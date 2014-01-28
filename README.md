moda_static
===========

[Middleman](http://middlemanapp.com/) static site generator:
[Gumby](http://gumbyframework.com/)

A front-end development framework for developing static sites.

initial setup
------------
* system requirements ruby-1.9.3
* even if ruby is already installed this tutorial walks through instalkation of [DevKit](https://sites.google.com/site/sproutframework/system-setup/windows)
* other information regarding DevKit, installation, troubleshooting [here](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit)

installation
------------
<pre>
  <code>
    cd into your directory
    git clone |this project|
    bundle install
    cd into /source
    middleman server
  </code>
</pre>

trouble shooting
----------------

* most things come down to bundle install

windows 7
-----------------
* windows livereload issue outlined [here](https://github.com/middleman/middleman-livereload/issues/26)
<pre>
  <code>
     activate :livereload, :host => '127.0.0.1'
     // this is necessary for getting livereload working
        on windows addresss should be: http://127.0.0.1:4567/

  </code>
</pre>

helpful links
-----------------
*  [haml docs](http://haml.info/docs/yardoc/file.REFERENCE.html)
*  [sass docs](http://sass-lang.com/documentation/file.SASS_REFERENCE.html)
*  [building with middleman article](http://12devs.co.uk/articles/204/)