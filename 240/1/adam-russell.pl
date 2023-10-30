#!/usr/bin/env perl
use v5.36;

use boolean;
sub acronym{
    my($strings, $acronym) = @_;
    return boolean(join(q//, map {(split //, lc $_)[0]} @{$strings}) eq lc $acronym);
}

MAIN:{
    say acronym [qw/Perl Python Pascal/], q/ppp/;
    say acronym [qw/Perl Raku/], q/rp/;
    say acronym [qw/Oracle Awk C/], q/oac/;
}
