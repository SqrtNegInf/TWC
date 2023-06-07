#!/usr/bin/env perl
use v5.36;

my ($max, $elems) = (5,3);

my @list = add_elements( $max, $elems, [[]] )->@*;

say ( "[" . (join ', ', map { "[". (join ',', $_->@*) . "]" } @list) . "]");


## ## ## ## ## SUBS:

sub add_elements {
    my ($max, $elems, $list) = @_;
    return $list if $list->[0]->@* == $elems;

    my @newlist = ();

    my $pos = $list->[0]->@* + 1;          ## this position, elems of prev list + 1

    for my $combo ( $list->@* ) {
        my $prev  = $combo->[-1] // 0;
        my $start = $prev + 1;             ## value of last elem in list + 1
        my $end   = $max - $elems + $pos;  ## max - length + position
        for ($start .. $end ) {
            push @newlist, [ $combo->@*, $_ ]
        }
    }
    return add_elements( $max, $elems, \@newlist);
}
