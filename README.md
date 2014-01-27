<h1>Intro</h1>

<p>This is a <strong>rails 4</strong> app  intended to be used as boilerplate for your own app, it has <strong>omniauth</strong> with:
<strong>facebook</strong> <strong>twitter</strong> and <strong>google+</strong> it is also integrated with <strong>twitter bootstrap 3</strong></p>

<h3>Install</h3>

<h5>In the command line run:</h5> 
<pre>
bundle
db:migrate
</pre>

<p>This will install the gems specified in <strong>Gemfile</strong> and create the Users table in the database (the database is specified as "test" change the <strong>config/database.yml</strong> to set your configuration)</p>

<h3>Omniauth</h3>
<p>You have to setup 3 apps: facebook, twitter and google+</p>
<p>In <strong>config/initializers/omniauth.rb</strong> you have to paste the app keys/ids and secrets of those apps</p>
<pre>
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
  provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET']
</pre>

<p>Or you can leave the file as it is and export the values from command line, for example:</>
<pre>
  export TWITTER_KEY=xxxxxx
</pre>

<h4>Omniauth Twitter Note</h4>
<p>For twitter there is logic to redirect the user to step to complete information that twitter does not provides with omniauth such as email.</p>

<h3>I18n</h3>
<p>The app has an initial setup of I18n for English and Spanish</p>


<hr>
<p>Use this code as you want! <strong>ENJOY!!</strong></p>
