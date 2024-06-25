#!/usr/bin/env perl
use v5.36;

my $str = "aabb";
position($str);

$str = "abab";
position($str);

$str = "aaa";
position($str);

$str = "bbb";
position($str);

exit 0;

sub position {
    my $str = shift;

    my $offset = index($str, 'b');
    printf "%s -> %s\n",
        $str,
        ($offset >= 0 and index($str, 'a', $offset) == -1)
            ? 'true'
            : 'false';
}
