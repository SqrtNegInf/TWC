#!/usr/bin/env perl
use v5.36;

no strict 'refs';

my $name = 'foo';

${$name} = 10;
say ${$name};
