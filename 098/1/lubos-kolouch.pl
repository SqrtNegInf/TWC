#!/usr/bin/env perl
use v5.36;

my $offset = 0;

sub get_n_characters {
    my $what = shift;

    open my $file, '<', $what->[0];
    seek $file, $offset, 0;
    read $file, my $output, $what->[1];
    $offset += $what->[1];
    
    # chomp to fix the problem with end of file
    chomp $output;
    return $output;
}

use Test::More;

is(get_n_characters(['input.txt', 4]), '1234');
is(get_n_characters(['input.txt', 4]), '5678');
is(get_n_characters(['input.txt', 2]), '90');

done_testing;
