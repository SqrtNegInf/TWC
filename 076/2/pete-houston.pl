#!/usr/bin/env perl
use v5.36;

use Path::Tiny 'path';
use Array::Transpose;
use List::Util 'first';
use List::MoreUtils 'uniq';

my $minlength  = 5;
my $gridstring = read_grid ('grid.txt');
my @words      = read_dictionary ('words.txt', $minlength);

my @matches    = solve ($gridstring, @words);
print "Found: " . scalar @matches .
	" words of length $minlength or more:\n@matches\n";
exit;

sub read_grid {
	my @rows = path(shift)->lines ({chomp => 1});
	s/\s+//g for @rows;
	my $c = '~'; # Any non-alpha char you like to serve as separator
	# Horizontals
	my $grid = join $c, @rows;
	# Create an AoA for the other directions
	$_ = [ split //, $_ ] for @rows;
	# Verticals
	$grid .= $c . join '', @$_ for transpose (\@rows);
	$grid .= $c;

	# Now we need to do the diagonals.
	# This is tortuous - there has to be a much neater way.

	my $rmax = $#rows;
	my $cmax = $#{$rows[0]};

	# \ diag
	# lower diag
	for my $row (0 .. $rmax) {
		my $i = $row;
		for my $col (0 .. $cmax) {
			last if $i > $rmax;
			$grid .= $rows[$i++]->[$col]
		}
		$grid .= $c;
	}
	# Upper diag
	for my $col (1 .. $cmax) {
		my $i = $col;
		for my $row (0 .. $rmax) {
			last if $i > $cmax;
			$grid .= $rows[$row]->[$i++]
		}
		$grid .= $c;
	}

	# / diag
	# lower diag
	for my $row (0 .. $rmax) {
		my $i = $row;
		for my $col (0 .. $cmax) {
			last if $i > $rmax;
			$grid .= $rows[$i++]->[$cmax - $col]
		}
		$grid .= $c;
	}
	# Upper diag
	for my $col (0 .. $cmax - 1) {
		my $i = $col;
		for my $row (0 .. $rmax) {
			last if $i < 0;
			$grid .= $rows[$row]->[$i--]
		}
		$grid .= $c;
	}

	# Uppercase
	$grid = uc $grid;
	# Append the reverse
	$grid .= reverse $grid;

	return $grid;
}

sub read_dictionary {
	my ($dictfile, $min) = @_;
	$dictfile = first { defined $_ && -r $_ }
		$dictfile,
		'words.txt',
		'/usr/dict/words';
	return uniq
		map { uc }
		grep { length($_) >= $min && !/[^a-z]/i }
		path ($dictfile)->lines ({chomp => 1});
}

sub solve {
	my ($grid, @words) = @_;
	return grep { index ($grid, $_) > -1 } @words;
}
