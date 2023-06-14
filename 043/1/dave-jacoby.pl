#!/usr/bin/env perl
use v5.36;

use List::Util qw{sum0};

my $nums = [ 1 .. 4, 6 ];

my @perms = permute_array($nums);

for my $p (@perms) {
    next unless eleven( 9, $p->[0] );             # red
    next unless eleven( 8, $p->[3] );             # purple
    next unless eleven( 5, $p->[0], $p->[1] );    # green
    next unless eleven( 7, $p->[2], $p->[3] );    # green
    next unless eleven( $p->[1], $p->[2], $p->[4] );
    say <<"END";
        red/green:      $p->[0]
        black/green:    $p->[1]
        black/yellow:   $p->[2]
        purple/yellow:  $p->[3]
        black:          $p->[4]
END
}

sub eleven ( @array ) {
    my $r = sum0 @array;
    my $s = $r == 11 ? 1 : 0;
    return $s;
}

sub permute_array ( $array ) {
    return $array if scalar $array->@* == 1;
    my @response = map {
        my $i        = $_;
        my $d        = $array->[$i];
        my $copy->@* = $array->@*;
        splice $copy->@*, $i, 1;
        my @out = map { unshift $_->@*, $d; $_ } permute_array($copy);
        @out
    } 0 .. scalar $array->@* - 1;
    return @response;
}
