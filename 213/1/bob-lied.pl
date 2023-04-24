#!/usr/bin/env perl

use v5.36;

use Getopt::Long;
my $DoTest  = 0;

GetOptions("test" => \$DoTest);
runTest();exit;

say "(", join(",", funSort(@ARGV)->@*), ")";

# Single sort with separation in sort function
sub funSort(@list)
{
    return [ sort { (($a & 1) <=> ($b & 1)) || ($a <=> $b) } @list ];
}

# Sort, then partition
sub funSort_part(@list)
{
    use List::MoreUtils qw/part/;
    #use List::Flatten qw/flat/;
    sub flat :prototype(@) { return map { ref eq 'ARRAY' ? @$_ : $_ } @_; }

    return [ grep { defined } flat part { $_ % 2 } sort { $a <=> $b} @list ];

}

# Partition, then sort each piece
sub funSort_partB(@list)
{
    use List::MoreUtils qw/part/;
    my @sorted;
    for my $sub ( part { $_ % 2} @list )
    {
        next unless defined $sub;
        push @sorted, sort { $a <=> $b } $sub->@*;
    }
    return \@sorted;
}

sub runTest
{
    use Test2::V0;

    is( funSort(1,2,3,4,5,6), [2,4,6,1,3,5], "Example 1");
    is( funSort(1,2        ), [2,1],         "Example 2");
    is( funSort(1          ), [1  ],         "Example 3");
    is( funSort(3,7,5,9,1  ), [1,3,5,7,9],   "Odds");
    is( funSort(2          ), [2  ],         "Evens 1");
    is( funSort(2,8,4,6    ), [2,4,6,8],     "Evens 2");

    is( funSort_part(1,2,3,4,5,6), [2,4,6,1,3,5], "Example 1");
    is( funSort_part(1,2        ), [2,1],         "Example 2");
    is( funSort_part(1          ), [1  ],         "Example 3");
    is( funSort_part(3,7,5,9,1  ), [1,3,5,7,9],   "Odds");
    is( funSort_part(2          ), [2  ],         "Evens 1");
    is( funSort_part(2,8,4,6    ), [2,4,6,8],     "Evens 2");

    is( funSort_partB(1,2,3,4,5,6), [2,4,6,1,3,5], "Example 1");
    is( funSort_partB(1,2        ), [2,1],         "Example 2");
    is( funSort_partB(1          ), [1  ],         "Example 3");
    is( funSort_partB(3,7,5,9,1  ), [1,3,5,7,9],   "Odds");
    is( funSort_partB(2          ), [2  ],         "Evens 1");
    is( funSort_partB(2,8,4,6    ), [2,4,6,8],     "Evens 2");

    done_testing;
}
