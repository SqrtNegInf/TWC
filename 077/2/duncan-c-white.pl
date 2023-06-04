#!/usr/bin/env perl
use v5.36;

use Function::Parameters;
use Data::Dumper;
use List::Util qw(max);

my $filename = 'board1.txt';

#
# my @g = readgrid($filename);
#	Read the ox grid file, return @g, the grid
#	(an array of array-refs).
#
fun readgrid( $filename )
{
	open( my $infh, '<', $filename ) || die;
	my @result;
	while( <$infh> )
	{
		chomp;
		tr/ \t[]//d;
		die "readgrid: bad line '$_'\n" unless /^[OX]+$/;
		my @ch = split(//);
		push @result, \@ch;
	}
	close($infh);
	return @result;
}

my @dir =
(
	[-1,0],	# up (delta r,c)
	[-1,1], # ne
	[0,1],  # e
	[1,1],  # se
	[1,0],  # down
	[1,-1], # sw
	[0,-1], # w
	[-1,-1],# nw
);


#
# my @sol = findlonelyxs( @grid );
#	Given @grid, a grid (array of array refs) read by readgrid(),
#	find all lonely Xs.  Return an array of [R,C] pairs.
#
fun findlonelyxs( @grid )
{
	my $rows = @grid;
	my $cols = @{$grid[0]};
	#say "debug: rows=$rows, cols=$cols";

	my @result;
	foreach my $r (0..$rows-1)
	{
		foreach my $c (0..$cols-1)
		{
			if( $grid[$r][$c] eq 'X' )
			{
				if( lonelyX( $r, $c, @grid ) )
				{
					#say "debug: found lonely X @ r=$r, c=$c";
					push @result, [$r,$c];
				}
			}
		}
	}
	return @result;
}


#
# my $islonely = lonelyX( $r, $c, @grid );
#	Given that cell ($r,$c) in @grid is an X, is it a lonely one?
#	Return 1 iff it is, otherwise 0.
#
fun lonelyX( $r, $c, @grid )
{
	my $rows = @grid;
	my $cols = @{$grid[0]};

	# build the "str of adjacent cell values" in $adjstr.
	my $adjstr = "";

	foreach my $dir (@dir)
	{
		my( $dr, $dc ) = @$dir;
		my $r2 = $r+$dr;
		my $c2 = $c+$dc;

		# have we fallen off the grid?
		next if $r2<0 || $r2>=$rows || $c2<0 || $c2>=$cols;
		my $ch = $grid[$r2][$c2];
		#say "debug: X pos ($r,$c), adj pos ($r2,$c2) on board, is $ch";
		$adjstr .= $ch;
	}
	#say "debug: X @ ($r,$c): adjstr: $adjstr";

	# not lonely if any 'X' in $adjstr, otherwise lonely
	return $adjstr =~ /X/ ? 0 : 1;
}


my @g = readgrid($filename);
#say Dumper \@g;

my @sol = findlonelyxs( @g );
my $n = @sol;
say "$n lonely Xs in grid: ", join(',',map { my($r,$c)=@$_; "[$r, $c]" } @sol);
