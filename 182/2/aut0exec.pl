#!/usr/bin/env perl
use v5.36;

my @filepaths = ( '/a/b/c/1/x.pl', '/a/b/c/d/e/2/x.pl', '/a/b/c/d/3/x.pl', 
				'/a/b/c/4/x.pl', '/a/b/c/d/5/x.pl', '/a/b/c/d/x.pl' );
my $path = ${filepaths[0]};

foreach ( @filepaths ) 
{
	my $test_path = $path;
	$path = '';
	my $len1 = length($test_path);
	my $len2 = length($_);
	my $size = $len1<$len2?$len1:$len2;
	
	for (my $i = 0; $i < $size; $i++)
	{
		if ( substr($test_path,$i,1) eq substr($_,$i,1) )
		{ $path .= substr($test_path,$i,1); }
		else
		{ last; }
	}	

}

	print ("Path match is: $path\n\n");
