#!/usr/bin/env perl

use v5.36;
use Test2::V0 -srand => 1;

is sequence_number('ab1234', 'cd5678', 'ef1342'),
   ['001234', '015678', '021342'], 'Example 1';

is sequence_number('pq1122', 'rs3334'),
   ['001122', '013334'], 'Example 2';

done_testing;

sub sequence_number(@list) {
    my @sn = ();
    my $i  = 0;
    foreach my $entry (@list) {
        next unless ($entry =~ /^[a-z]{2}(\d{4})$/);
        push @sn, sprintf("%02d%d", $i++, $1);
    }

    return \@sn;
}
