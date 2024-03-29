#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum max);
use List::MoreUtils qw(indexes);

my @narray = 1..4;

sub foo {
    my ( $so_far, $pick_from, $the_rest ) = @_;
    my @so_far    = @$so_far;
    my @pick_from = @$pick_from;
    my @the_rest  = @$the_rest;
    if ( @pick_from == 0 ) {
        print( '[', join( ', ', @so_far ), "]\n" ) unless @the_rest;
        return;
    }
    else {
        for my $i ( 0 .. $#pick_from ) {
            my @tmp_so_far    = @so_far;
            my @tmp_pick_from = @pick_from;
            my @tmp_the_rest  = @the_rest;
            push @tmp_so_far, $pick_from[$i];
            my @pick_from_prev = @pick_from[ 0 .. $i ];
            pop @pick_from_prev;
            my @pick_from_post = @pick_from[ $i .. $#pick_from ];
            shift @pick_from_post;
            foo(
                [@tmp_so_far],
                [ reverse( @pick_from_post, @tmp_the_rest ) ],
                [ reverse @pick_from_prev ],
            );
        }
    }
}

if ( @narray > 1 ) {
    for my $i ( 0 .. ( $#narray - 1 ) ) {
        next if $i > 0 and $narray[$i] == $narray[ $i - 1 ];
        my @so_far         = ( $narray[$i], );
        my @pick_from_prev = @narray[ 0 .. $i ];
        pop @pick_from_prev;
        my @pick_from_post = @narray[ $i .. $#narray ];
        shift @pick_from_post;
        foo(
            [@so_far],
            [ reverse @pick_from_post ],
            [ reverse @pick_from_prev ],
        );
    }
}
else {
    print( '[', join( ', ', @narray ), "]\n" );
}

