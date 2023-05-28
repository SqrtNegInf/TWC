#!/usr/bin/env perl
use v5.36;

my $var = 'Test';
my $address = sprintf("%p", $var);
printf("%d %s$/", hex($address), $address);
