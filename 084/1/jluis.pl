#!/usr/bin/env perl
use v5.36;

my $N = -1700   ;

if ($N =~ /^([+-]?)(\d+)$/) {
	my $sign    = $1;
	my $new_val = reverse $2;
  	$new_val = 0 if (!$sign or $sign eq q(+)) and $new_val > 2147483647;
	$new_val = 0 if $sign eq q(-) and $new_val > 2147483648;
	say $sign,$new_val;
} else {
	say "($N)An integer consist of an optional sign and dgits ";
}





