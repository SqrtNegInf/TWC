#!/usr/bin/env perl
use v5.36;

my $n = 50;

my @ppl = (1) x $n;
my $swordposition;
$swordposition = 0;


sub nextalive {
	my $temp = $_[0];
	do {
		$temp = (($temp//0)+1) % $n;
	} until ($ppl[$temp] == 1);

	$temp;
}

sub killing {
	$ppl[&nextalive($_[0])] = 0;
}

for my $i (1..$n-1) {
	my $soldier = $swordposition;
	&killing($swordposition); # print "one man has been killed. \n";
        $swordposition = &nextalive($soldier);
}

print &nextalive+1;
