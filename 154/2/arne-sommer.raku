#!/usr/bin/env raku

unit sub MAIN (:c(:$count) = 10);

my $padovan := ( 1, 1, 1, ( * + * + * * 0 ) ... Inf);

say $padovan[^$count].join(", ");
