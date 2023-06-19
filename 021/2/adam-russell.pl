#!/usr/bin/env perl
use v5.36;

use lib '.';
use UrlParser;

use constant URL => q|JDBC://user:password@localhost:3306/pwc?profile=true#h1|; 
#use constant URL => "HTTP://www.example.com:80/a%C2%B1b/%7Eusername"; 
MAIN:{
    my $parser = UrlParser->new;
    $parser->parse(URL);
}  
