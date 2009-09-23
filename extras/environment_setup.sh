#!/bin/sh
# pobranie niezbędnych pakietów
sudo apt-get install build-essential zlib1g-dev \
libreadline5-dev libssl-dev libmagick++-dev \
libsqlite3-dev imagemagick libxslt1-dev libxml2-dev
# pobranie wersji 1.8.7
wget ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p174.tar.gz
# rozpakowanie pliku .tar.gz
tar -xzf ruby-1.8.7-p174.tar.gz
# przejście do katalogu oraz kompilacja
cd ruby-1.8.7-p174
./configure
make
sudo make install
cd ..
# pobranie źródeł RubyGems
wget http://rubyforge.org/frs/download.php/60718/rubygems-1.3.5.tgz
# rozpakowanie oraz kompilacja
tar -xzf rubygems-1.3.5.tgz
cd rubygems-1.3.5
sudo ruby setup.rb
# aktualizacja do najnowszej wersji
sudo gem update --system
cd ..
# instalacja Gita
sudo apt-get install git-core
# pobranie aktualnej wersji kodu aplikacji do bieżącego katalogu
git clone git://github.com/morgoth/quiz.git
cd quiz
# dodanie serwera GitHub do dostępnych źródeł
sudo gem sources -a http://gems.github.com
cp config/example_database.yml config/database.yml
# instalacja Ruby on Rails
sudo gem install rails
# instalacja gema dla bazy danych SQLite3
sudo gem install sqlite3-ruby
# instalacja używanych gemów
sudo rake gems:install RAILS_ENV=test
# ładowanie schematu bazy danych
rake db:schema:load
# uruchomienie testów jednostkowych
rake test:units
# uruchomienie testów integracyjnych
cucumber
# utworzenie początkowych danych
rake db:seed
# uruchomienie lokalnego serwera
script/server
