#!/usr/bin/env perl
use v5.36;
use Modern::Perl;
use List::Util qw( any );

my @keys = qw( qwertyuiop asdfghjkl zxcvbnm );

sub can_type_word {
    my($word) = @_;
    $word =~ s/\W//g;
    return any {($word =~ s/[$_]//gir) eq ""} @keys;
}

sub can_type {
    my(@words) = @_;
    return grep {can_type_word($_)} @words;
}

say join(" ", can_type(<Hello Alaska Dad Peace>));
