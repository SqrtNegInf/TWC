#!/usr/bin/env raku

my $name = "foo"; my $value = 42;
spurt 'MySymbols.pm6', "use v6; unit module MySymbols; my \\$name = \'42\'; say \"$name = $value\"";
use lib '.';
require MySymbols;
unlink 'MySymbols.pm6';
