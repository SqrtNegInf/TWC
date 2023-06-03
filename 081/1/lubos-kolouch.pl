#!/usr/bin/env perl
use v5.36;

sub get_common_strings {
	my $arg = shift;

	my $str1 = $arg->{str1};
	my $str2 = $arg->{str2};

	my @result;

	my ($res1) = $str1 =~ /(.*)\1+/;
	push @result, $res1;

	my ($res2) = $str2 =~ /(.*)\1+/;
	push @result, $res2 unless $res1 eq $res2;

	return \@result;

}

use Test::More;

is_deeply(get_common_strings({str1 => 'abcdabcd', str2 => 'abcdabcdabcdabcd'} ),['abcd','abcdabcd']);
is_deeply(get_common_strings({str1 => 'aaa', str2 => 'aa'} ),['a']);
is_deeply(get_common_strings({str1 => 'abc', str2 => 'aa'} ),['','a']);

done_testing;
