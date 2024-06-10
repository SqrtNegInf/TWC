#!/usr/bin/env raku

my $address = "1.1.1.1";
$address ~~ s:g['.'] = "[.]" ;
say $address ;
