## About

> Before bringing out the best, one must fight the Dark Dragon from within.

  \- The Tale of the Dark Dragon

`dark_dragon` brings out the best in `sed`/`awk`/`xargs` by giving them a ruby-like syntax.

### Install

    gem build dark_dragon.gemspec
    gem install dark_dragon-<version>.gem

### Usage

show each line

    dark_dragon file.txt 'puts line'

show each line with line numbers

    dark_dragon file.txt 'puts "#{line_number}: #{line}"'

show line conditionally

    dark_dragon file.txt 'puts line if line_number.even?'
