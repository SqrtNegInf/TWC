#!/usr/bin/env perl
use v5.36;

my @start=split '', 'bat';
my @end=split '', 'big';
my $wordPath= 'words3';

die "Words not the same length: Ladder: ()\n" if (@start != @end);

open my $wfh, "<" , $wordPath;
my @words;
my $ok=0;
my $start='bat';
my $end='big';
while (<$wfh>) {
        chomp;
	$ok++ if $_ eq $start;
	$ok++ if $_ eq $end;;
        my @a=(split '', lc $_);
        push @words, \@a if @a == @start;
}
close $wfh;
die "Words not in dictionary: Ladder: ()\n" if ($ok!=2);

my @transforms;
push @transforms, {w=>\@start, p=>undef};
my @seen;
push @seen, \@start;
my $result;
my $i=0;

while (@transforms != 0) {
	my $e=shift @transforms;
	my $c=$$e{w};
	#print "Iteration: $i, Queue length: ".scalar @transforms." Current word: @$c\n";
	#print "@$c";
	$result=$e;
	last if (join ('', @$c) eq join ('', @end));
	map { 
		my $d=$_;
		my $sum=0;
		for (my $i=0; $i<@$c ;$i++) {
			$sum++ if @$d[$i] eq @$c[$i];
		}
		my $part1= $sum == (@$c-1);	
		my $part2=grep({ join '', $_ eq join '', @$d} @seen) == 0;
		if ($part1 && $part2) {
			#print @$d;
			push @seen, $d;
			push @transforms, {w=>$d, p=>$e};
		}

	} @words;
	$i++;
}
if ($result) {
	print "Ladder: (".join(" ", reverse pathFromParent($result, \@start)).")";

}
else {
	print "No ladder found: Ladder: ()";
}

sub pathFromParent {
	my $parent= shift;
	my $word= shift;
	my @path;
	#print @{$$result{w}};;
	while ($parent) {
		push @path, join ('', @{$$parent{w}});
		#print @path;
		last if (join ('', @{$$parent{w}}) eq join('', @$word));
		$parent=$$parent{p};
	}
	return @path;
}
