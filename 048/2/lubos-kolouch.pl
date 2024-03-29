#!/usr/bin/env perl
use v5.36;

use DateTime;

sub is_palindrome {
    my $dt = shift;

    return 1 if $dt->mdy('') eq reverse $dt->mdy('');

    return 0;
}

my $dt_start = DateTime->new( year => 2000, month => 1, day => 1 );
my $epoch_test = $dt_start->epoch;

my $dt_end = DateTime->new( year => 2999, month => 12, day => 31 );
my $epoch_end = $dt_end->epoch;

while ($epoch_test < $epoch_end) {
    my $dt = DateTime->from_epoch( epoch => $epoch_test);

    say $dt->mdy if is_palindrome($dt);
    $epoch_test += 60 * 60 * 24;
}

