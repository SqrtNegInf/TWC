#!/usr/bin/env perl
use v5.36;
use Test::More;

sub capital {
	return $_[ 0 ] =~ m/^ (?: [A-Z]?[a-z]+ | [A-Z]+ ) $/x ? 1 : 0;
}

is_deeply( [ map { capital( $_ ) } qw(Perl TPF PyThon raku) ], [ qw(1 1 0 1) ], "Appropiate usage of Capital letters?" );

done_testing( 1 );
