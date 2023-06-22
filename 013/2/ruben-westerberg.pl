#!/usr/bin/env perl
use v5.36;

sub male {
	my $n=shift;
	$n==0?0:($n-female(male($n-1)));
}

sub female {
	my $n=shift;
	$n==0?1:($n-male(female($n-1)));
}
my @male;
my @female;
for (0..($ARGV[0]//19)) {
	push @female, female($_);
	push @male, male($_);
}
print "  Male sequence: ",join(", ", @male)."\n";
print "Femail sequence: ",join(", ", @female)."\n";
