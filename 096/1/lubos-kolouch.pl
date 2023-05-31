#!/usr/bin/env perl
use v5.36;

sub reverse_words {
    my $what = shift;

    # split leaves the initial space
    $what =~ s/^\s+//;

    return  join ' ', reverse split /\s+/, $what;
}

use Test::More;

is(reverse_words('The Weekly Challenge'), 'Challenge Weekly The');
is(reverse_words('    Perl and   Raku are  part of the same family  '), 'family same the of part are Raku and Perl');

done_testing;
