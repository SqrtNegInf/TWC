#!/usr/bin/env perl
use v5.36;

sub compare_versions {
    my ($ver1, $ver2) = @_;

    my $v1 = version->new($ver1);
    my $v2 = version->new($ver2);

    return $v1 <=> $v2;
}

# TESTS

use Test::More;

is(compare_versions('0.1','1.1'),-1);
is(compare_versions('2.0','1.2'),1);
is(compare_versions('1.2','1.2_5'),-1);

# There is likely bug in the module, I have reported it
# https://rt.cpan.org/Ticket/Display.html?id=132482
#is(compare_versions('1.2.1','1.2_1'),1);
is(compare_versions('1.2.1','1.2.1'),0);
done_testing();
