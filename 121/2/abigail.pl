#!/usr/bin/env perl
use v5.36;

#
# Find the shorted path from '$from' to '$to', using all entries
# in '$matrix', except the ones in '$exclude'.
#
sub shortest_path ($matrix, $from, $to, $exclude) {
    if (1 + keys %$exclude == @$matrix) {
        #
        # We have excluded everything, except the destination.
        # This makes it the only, and hence, shortest path.
        #
        return ($$matrix [$from] [$to], [$to]);
    }

    #
    # Else, try each node other than $from, $to, and what's in $exclude,
    # as the first step. Then recurse, and return the shortest.
    #
    my $shortest = ~0;
    my @shortest_path;
    my %new_exclude = (%$exclude, $from => 1);
    foreach my $next (0 .. @$matrix - 1) {
        next if $next == $from || $next == $to || $$exclude {$next};
        my ($length, $path) = shortest_path ($matrix, $next, $to,
                                            \%new_exclude);
        if ($shortest > $length + $$matrix [$from] [$next]) {
            $shortest = $length + $$matrix [$from] [$next];
            @shortest_path = ($next, @$path);
        }
    }
    return $shortest, \@shortest_path;
}



my @matrix = map {[split]} <DATA>;

my  ($length, $path) = shortest_path \@matrix, 0, 0, {};
say "$length\n0 @$path";

__END__
0 5 2 7
5 0 5 3
3 1 0 6
4 5 4 0
