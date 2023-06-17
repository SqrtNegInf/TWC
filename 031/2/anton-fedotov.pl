#!/usr/bin/env perl
use v5.36;
no strict 'refs';

my $name = 'foo';
my $value = 'boo';
if (defined($value)) {$$name = $value}
else {$$name = 'I love Star Wars'}
say "Variable named $name have value: $$name";
