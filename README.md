# Strolling Garry ᕕ( ᐛ )ᕗ

[![Code Climate](https://codeclimate.com/github/maximebedard/strolling_garry/badges/gpa.svg)](https://codeclimate.com/github/maximebedard/strolling_garry)

[![Circle CI](https://circleci.com/gh/maximebedard/strolling_garry/tree/master.png?style=badge)](https://circleci.com/gh/maximebedard/strolling_garry/tree/master)

# Installation

## Windows

- Installation de [Rails installer](http://railsinstaller.org/en)
- Dans la console de ruby

```
cd .\log330
bundle install
bundle exec rails server
```
- À partir du navigateur accéder à [localhost:4000](http://localhost:4000)

## Mac OS X

- Installer [Xcode](https://developer.apple.com/downloads)
- Installer [Homebrew](http://brew.sh)
- Dans le terminal

```
brew install rbenv
brew install ruby-build
```

- Ajouter les lignes suivantes dans le fichier `~/.bash_profile`

```
# Shell custom PATH
PATH=$PATH:~/.rbenv/shims:/usr/local/bin

# RBENV
eval "$(rbenv init -)"
```

- Installer ruby et rails

```
rbenv install 1.9.3-p547
rbenv global 1.9.3-p547
rbenv rehash

gem install rails -v 3.2.19
```

- Cloner le repository

```
git clone https://github.com/maximebedard/log330 ~/Github/log330
cd ~/Github/log330
bundle install
bundle exec rails server
```

- À partir du navigateur accéder à [localhost:4000](http://localhost:4000)


# Installation des dépendances (Bower)

Afin de pouvoir utiliser des libraries CSS et Javascript efficacement,
l'utilitaire [Bower](http://bower.io/) est utilisé. Celui-ci nécessite d'avoir
NodeJs d'instalé.

Pour installer les dépendances, voir dans les sections suivantes pour installer
Bower. Pour installer les dépendances :

```
cd strolling_garry
bower install
```

## Windows

1. Installer [NodeJS](http://nodejs.org/)
2. Installer [Git](http://git-scm.com/) (si ce n'est pas déjà fait)
3. Dans le terminal

```
npm install -g bower
```

## OS X

```
brew install npm
npm install -g bower
```
