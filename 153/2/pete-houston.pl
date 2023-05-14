#!/usr/bin/env perl
use v5.36;

printf "%i\n", is_factorion ($ARGV[0]) ? 1 : 0;

# Instead of List::Util::sum
sub sum {
	my $tot = shift;
	$tot += $_ for @_;
	return $tot;
}

# Instead of Math::Prime::Util::factorial
sub fac {
	state $have = { 0 => 1 };
	my $i = shift;
	return $have->{$i} if $have->{$i};
	my $fac = $i * fac ($i - 1);
	$have->{$i} = $fac;
	return $fac;
}

sub is_factorion {
	my $n = shift;
	return 0 unless defined ($n) && $n =~ /^[1-9][0-9]*$/;
	return $n == sum map { fac ($_) } split //, $n;
}
