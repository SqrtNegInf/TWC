#!/usr/bin/env perl

use v5.36;

for( 4,5,6 ){
    my $binary = sprintf "%b", $_;
    my $mask=oct "0b". "1"x length $binary;
    say "$_ -> ", ~$_ & $mask;
}
