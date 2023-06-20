#!/usr/bin/env perl
use v5.36;

use lib '.';
use UrlParser;
use constant URL => q|jdbc://user:password@localhost:3306/pwc?profile=true#h1|; 

MAIN:{
    my $parser = UrlParser->new;
    $parser->parse(URL);
}  
