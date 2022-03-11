#!/usr/bin/env raku

unit sub MAIN ($file-with-words = 'words');

$file-with-words.IO
#andthen .lines().race
andthen .lines()
andthen .grep: {  $_ eq .comb.sort.join }\ #collate
andthen .max: *.chars
andthen .say
