#!/usr/bin/env perl
use v5.36;

my $address = "1.1.1.1";
$address =~ s/\./\[\.\]/g ;
say $address ;
