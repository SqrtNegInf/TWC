#!/usr/bin/env raku
my $variable = "\$" ~ 'foo';
my $value = 42;
spurt "Temp.pm6", "unit module Temp; my $variable = $value; say \"The value of \\$variable is $variable.\"";
use lib ".";
require Temp;
unlink "Temp.pm6";
