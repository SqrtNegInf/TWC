#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

my $sep = ' ';

my %freq;
while( <DATA> )
{
	chomp;
	$freq{$_}++;
}

foreach my $str (sort { $freq{$b} <=> $freq{$a} } keys %freq)
{
	my $v = $freq{$str};
	say "$str$sep$v";
}

__END__
apple
banana
apple
cherry
cherry
apple
