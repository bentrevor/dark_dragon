## About

> Before bringing out the best, one must fight the Dark Dragon from within.

  \- The Tale of the Dark Dragon

`dark_dragon` brings out the best in `sed`/`awk`/`xargs` by giving them a ruby-like syntax.

### Install

    gem build dark_dragon.gemspec
    gem install dark_dragon-<version>.gem

### Usage

All the gem does is eval a command for each line of the file, and it defines certain convenient
variables: `line`, `line_number`, etc.  The format is `dark_dragon <input file> <command>`.

### Examples

show each line

    dark_dragon file.txt 'line'

show each line number

    dark_dragon file.txt 'line_number'

count each line

    dark_dragon file.txt 'count'

string interpolation

    dark_dragon file.txt '"#{line_number}: #{line}"'

show line conditionally

    dark_dragon file.txt 'line if line_number.even?'

delete all lines

    dark_dragon file.txt 'nil'
    dark_dragon file.txt 'delete(line)'

delete lines conditionally

    dark_dragon file.txt 'line.length > 5 ? nil : line'
    dark_dragon file.txt 'delete(line) if line.length > 5'
