#!/usr/bin/env perl
use v5.36;

use List::Util qw(min);

my $A = $ARGV[0] || "7, 8, 3, 12, 10";

print "$A\n";
print join("\n", (join ', ', @{smallest_neighbour($A)}), "");

#
#
# METHOD

sub smallest_neighbour {
    my ($list) = @_;

    die "ERROR: Missing list.\n"
        unless defined $list;
    die "ERROR: Invalid list [$list].\n"
        unless ($list =~ /^[\s?\-?\d\,?\s?]+$/);

    $list =~ s/\s//g;
    $list = [ split /\,/, $list ];

    my @smallest_neighbour = (0);
    foreach my $i (1 .. $#$list) {
        my $min = min( map { $list->[$_] } 0..$i-1 );
        push @smallest_neighbour, ($min < $list->[$i])?($min):(0);
    }

    return \@smallest_neighbour;
}
