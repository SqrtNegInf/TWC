#!/usr/bin/env perl
use v5.36;

use POSIX qw(floor);

print find_majority_element(prepare_list($ARGV[0])), "\n";

sub find_majority_element {
    my ($list) = @_;

    die "ERROR: Missing list.\n"         unless defined $list;
    die "ERROR: Invalid list [$list].\n" unless (ref($list) eq 'ARRAY');

    print "List: ", join(", ", @$list), "\n";
    my $mid_point = floor(($#$list + 1) / 2);
    my %elements  = ();
    $elements{$_}++ foreach (@$list);

    my $top = (sort { $elements{$b} <=> $elements{$a} }
               keys %elements)[0];

    ($elements{$top} >= $mid_point)
    ?
    (return $top)
    :
    (return -1);
}

sub prepare_list {
    my ($list) = @_;

    if (defined $list) {
        $list =~ s/\s//g;
        return [ split /\,/, $list ];
    }
    else {
        return [1, 2, 2, 3, 2, 4, 2];
    }
}
