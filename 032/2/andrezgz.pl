#!/usr/bin/env perl

use strict;
use warnings;

use List::Util qw/max/;

my $source = { apple => 3, cherry => 2, banana => 1, orange => 2.5 };

print "Sorted by name\n";
generate_bar_graph($source,{sort => 'labels' });

print "Sorted by value\n";
generate_bar_graph($source,{sort => 'values' });

sub generate_bar_graph {
    my $data = shift;
    my $args = shift;

    my @sorted_keys = keys %$data;
    if ($args->{sort} eq 'values') {
        # keys sorted by values (desc)
        @sorted_keys = reverse sort { $data->{$a} <=> $data->{$b} } @sorted_keys;
    }
    else{
        # keys sorted (asc)
        @sorted_keys = sort @sorted_keys;
    }

    my $inc = 50 / max (values %$data); # percentage increment
    print   join "\n",
            map  { sprintf '%-10s| %s',
                    $_,
                    '#' x ($data->{$_} * $inc)
                 }
            @sorted_keys;

    print "\n";
    return;
}

__END__

./ch-2.pl
Sorted by name
apple     | ##################################################
banana    | ################
cherry    | #################################
orange    | #########################################
Sorted by value
apple     | ##################################################
orange    | #########################################
cherry    | #################################
banana    | ################
