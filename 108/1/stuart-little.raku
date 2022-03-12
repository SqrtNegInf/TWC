#!/usr/bin/env raku
use v6;

# run <script>

my $x=5;
say qq|The variable \$x has value $x and address {$x.WHERE}.|;
