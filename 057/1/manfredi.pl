#!/usr/bin/env perl
use v5.36;

# breadth-first search
sub bfs {
	my @ret;
	my @a = shift;
	while (@a) {
		my $v = shift @a or next;
		push @ret, $v->[0];
		push @a, @{$v}[1,2];
	}
	return @ret;
}


sub invert {
	my @ret;
	my @a = shift;
	while (@a) {
		my $v = shift @a or next;
		push @ret, $v->[0];
		push @a, @{$v}[2,1];
	}
	return @ret;
}



# Full Binary Tree
my $tree = [1,[2,[4],[5]],[3,[6],[7]]];
# my $tree = [1,[2,[4,[8],[9]],[5,[10],[11]]],[3,[6,[12],[13]],[7,[14],[15]]]];

my @bfs = bfs($tree);
print "Full Binary Tree: [@bfs]\n";
&pretty_print(\@bfs);

my @inverted = invert($tree);
print "Full Binary Tree Inverted: [@inverted]\n";
&pretty_print(\@inverted);


# Geometric series, Power of two:
sub pretty_print {
	my @tree = @{+shift};
	my $i = 0;
	while(1) {
		my $items = 2**$i;
		my @row = splice @tree, 0, $items;
		last unless @row;
		print "| @row\n";
		$i++;
	}
}
