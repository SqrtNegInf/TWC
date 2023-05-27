#!/usr/bin/env perl
use v5.36;

use File::Basename qw(dirname);
use File::Slurp;
use Array::Transpose;

use Test::More;
use Test::Deep;

# Work relative from script directory
chdir(dirname($0));

cmp_deeply ([transposeFile('example.csv')],
            ['name,Mohammad,Joe,Julie,Cristina',
             'age,45,20,35,10',
             'sex,m,m,f,f']);

done_testing;


sub transposeFile {
  map{join(',',@$_)}transpose[map{s/^\s*(.*?)\s*$/$1/;[split/,/]}read_file($_[0])];
}

