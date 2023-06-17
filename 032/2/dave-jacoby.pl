#!/usr/bin/env perl
use v5.36;

use List::Util qw{max};
use Getopt::Long;

my $values = 0;
GetOptions( 'values' => \$values, );
my $order = $values ? 'values' : 'label';
my $data = { apple => 3, cherry => 2, banana => 1 };

generate_bar_graph( $data, $order );

exit;

# I am not the happiest with this code, because the length of the
# bar is hardcoded to be 4 times the number given. If data was to show
# the vote tally for even a small local election, the numbers would 
# expand FAR past the size of the terminal. But, given the data we have, 
# it works.

# example used left-padding for the key names, and I replicated that.
# "string x number of repeats" is cool and useful

sub generate_bar_graph ( $data, $order = 'label' ) {
    my @keys = sort keys $data->%*;
    @keys = sort { $data->{$b} <=> $data->{$a} } keys $data->%*
        if $order eq 'values';

    my $max = 4 + max map { length $_ } @keys;

    for my $k (@keys) {
        my $v   = 0 + $data->{$k};
        my $pad = ' ' x ( $max - length $k );
        say join '' , $pad, $k, ' | ',  '#' x ( 4 * $v );
    }
}
