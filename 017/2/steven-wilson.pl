#!/usr/bin/env perl
use v5.36;

my $url = 'jdbc:mysql://user:password@localhost:3306/pwc?profile=true#h1';

$url =~ /^(.+):\/\/(.+)@(.+):(\d+)(\/.+)[?](.+)#(.+)/;

say "scheme:    $1";
say "userinfo:  $2";
say "host:      $3";
say "port:      $4";
say "path:      $5";
say "query:     $6";
say "fragment:  $7";
