#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

my $address = "1.1.1.1";
$address =~ s/\./\[\.\]/g ;
say $address ;
