#!/usr/bin/env perl
use v5.36;

use List::Util qw(min max);

# Minimal word length to search for.
use constant MIN => 5;

# Read the letter grid.  The letters may be separated by whitespace.
sub read_grid {
	open my $fh, '<', shift;

	map [split /\s*/], <$fh>;
}

# Read the dictionary and build a regex that matches all individual
# words.  Inspired by https://perlmonks.org/?node_id=1179840.
# Longer matching words take precedence over shorter ones.
# Overlapping words are not searched for.  This gives less matches
# than the example.
sub read_dict {
	open my $fh, '<', shift;

	# Returns qr/(?:word1|word2|...|wordN)/i
	sub {local $" = '|'; qr/(?:@_)/i}->(
		map {quotemeta}
		sort {length $b <=> length $a}
		map {chomp; length >= MIN ? $_ : ()} <$fh>);
}

# Create index mappings for four directions.
# Each mapping consists of a list of lists of index pairs that
# specify the grid positions forming a string to be examined.
# [0, 0] is top left, [$rows - 1, $cols - 1] is bottom right.
# Returns an array of subs that create a specific indexing.
sub indexing {
	my ($rows, $cols) = @_;

	# Helper to calculate the end index for the traversal of a diagonal:
	# Starts at 0, grows to the plateau at min($rows, $cols) - 1
	# and then decreases to 0.  The plateau degenerates to a peak
	# if $rows == $cols.
	my $diag_end = sub {
		my $diag = shift;
		min($diag, $rows - 1, $cols - 1, $rows + $cols - 2 - $diag);
	};

	(
		# east
		sub {
			map {
				my $row = $_;
				# Strings run towards east.

				[map [$row, $_], 0 .. $cols - 1];
			} 0 .. $rows - 1;
		},

		# south
		sub {
			map {
				my $col = $_;
				# Strings run towards south.

				[map [$_, $col], 0 .. $rows - 1];
			} 0 .. $cols - 1;
		},

		# southeast
		sub {
			map {
				my $diag = $_;
				# Start of string moves from bottom left up to top left
				# and then from top left to top right.  Strings run
				# towards southeast.
				my $row = max($rows - 1 - $diag, 0);
				my $col = max($diag - $rows + 1, 0);

				[map [$row + $_, $col + $_], 0 .. $diag_end->($diag)];
			} 0 .. $rows + $cols - 2;
		},

		# northeast
		sub {
			map {
				my $diag = $_;
				# Start of string moves from top left down to bottom left
				# and then from bottom left to bottom right.  Strings run
				# towards northeast.
				my $row = min($diag, $rows - 1);
				my $col = max($diag - $rows + 1, 0);

				[map [$row - $_, $col + $_], 0 .. $diag_end->($diag)];
			} 0 .. $rows + $cols - 2;
		}
	);
}

#
# main
#

my @grid = read_grid $ARGV[0] // 'grid.txt';
my $words = read_dict $ARGV[1] // 'words.txt';

local $\ = "\n";

# Apply each indexing to the grid data and match the retrieved strings
# forward and reversed against the dictionary.
for my $index (indexing scalar(@grid), scalar@{$grid[0]}) {
	print foreach map /($words)/g, map {($_, scalar reverse)}
		map {join '', map $grid[$_->[0]][$_->[1]], @$_} $index->();
}
