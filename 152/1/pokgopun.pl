#!/usr/bin/env perl
use v5.36;

my @sample;
### If scripts' arguments present, convert them to triangle array
{
	last unless @ARGV;
	push @sample, [ map{[$_=~/(\d+)/g]} @ARGV ];
}
### Add sample triangle arrays if none available
{
	last if @sample;
	push @sample, [ [1], [5,3], [2,3,4], [7,1,0,2], [6,4,5,2,8] ];
	push @sample, [ [5], [2,3], [4,1,5], [0,1,2,3], [7,2,4,1,9] ];
}
#print Dumper \@sample;
### Generate array of min path
sub minPath {
	my $path = shift;
	my @minPath;
	push @minPath, [sort { $a <=> $b } @$_]->[0] foreach @$path;
	return @minPath
}
### Generate output similar to those in examples of the challenge's task 
foreach my $s (@sample) {
	printf "\nInput: \$triangle = [ %s ]\n\n", join(", ", map{"[".join(",",@$_)."]"} @$s );
	print "\t"," " x scalar(@{$s->[-1-$_]}), join(" ",@{$s->[$_]}),"\n" foreach 0..$#$s;
	my @minPath = minPath($s);
	my $sumText = join(" + ",@minPath);
	my $sum = eval($sumText);
	print "\nOutput: $sum\n\n\tMinimum Sum Path = $sumText => $sum\n", 
}
