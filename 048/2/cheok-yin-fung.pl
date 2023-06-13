#!/usr/bin/env perl
use v5.36;

my @dd = ("02", 12, 22);
my @ddr = (20, 21, 22);

# There are 3*12 = 36 Palindrome. Dates Each of different years.

my @mm;
for my $i (0..11) {
	if ($i <= 8) {
	       	$mm[$i] = "0"; $mm[$i] .=($i+1) ;
	} else {$mm[$i] = $i+1;}

}

my @temp;

foreach my $i (@mm) {
	$temp[$i] = scalar reverse $i;
}

@temp = sort {$a cmp $b} @temp;

for my $i (0..2) {
	for my $j (0..11) {
		my $ttemp = scalar reverse $temp[$j];
		print $ttemp.$dd[$i].$ddr[$i].$temp[$j]."\n";
	}
}


