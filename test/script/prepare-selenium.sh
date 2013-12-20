#!/bin/bash -e

# Expected to be run from repo root.

SELENIUM_VERSION=${SELENIUM_VERSION-2.38.0}

mkdir -p test/bin
cd test/bin
export SELENIUM_SERVER_STANDALONE_JAR="$(pwd)/selenium-server-standalone-$SELENIUM_VERSION.jar"
if [ ! -f $SELENIUM_SERVER_STANDALONE_JAR ]; then
  wget http://selenium.googlecode.com/files/selenium-server-standalone-$SELENIUM_VERSION.jar
fi
cd ../..

# Drop stuff where webdriver-sync wants to see it.
# whack all this after we merge https://github.com/jsdevel/webdriver-sync/pull/37#issuecomment-31043166
mkdir ~/.webdriver-sync
ln -s $SELENIUM_SERVER_STANDALONE_JAR "$HOME/.webdriver-sync/selenium-server-standalone.jar"
touch ~/.webdriver-sync/chromedriver
