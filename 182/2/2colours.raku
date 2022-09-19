#!/usr/bin/env raku

my @files = 'paths.txt'.IO.slurp.lines;
[Zeq] @files>>.split: '/' andthen .toggle: *.so andthen .Int andthen '/' ~ @files[0].split('/')[1..^$_].join('/') andthen .say;
