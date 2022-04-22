#!/usr/bin/env perl
#use v5.10;
use warnings;
no strict 'refs'; # we're specifically abusing this feature

my $var = 'foo';

$$var = 42;
print $$var, "\n";
