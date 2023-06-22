#!/usr/bin/env perl
use v5.36;

sub find_common_path {
    my ( $sep, @paths ) = @_;

    # we start building a 2 dimmension array with all the parts on each path
    # note the third argument of split function, that will consider
    # a path ending with the separator diffent from the same path
    # without a last separator
    my @atoms;
    for my $p (@paths) {
        push @atoms, [ split $sep, $p, -1 ];
    }

    # now we just need to calculate a number (n), that will represent
    # the amount of common parts on all paths
    my $n = 0;
    while ( $n < @{ $atoms[0] } ) {
        my $same = 1;
        my $atom = $atoms[0][$n];
        for my $i ( 1 .. $#paths ) {
            $same = 0 unless defined $atoms[$i][$n] && $atom eq $atoms[$i][$n];
        }
        last unless $same;
        $n++;
    }
    $n--;    # common part is just one less than the one that failed
    return join $sep, @{ $atoms[0] }[ 0 .. $n ];
}

say "Common path of /a/b/c/d, /a/b/cd, /a/b/cc, /a/b/c/d/e is ",
  find_common_path( '/', qw{/a/b/c/d /a/b/cd /a/b/cc /a/b/c/d/e} );
