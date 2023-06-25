#!/usr/bin/env perl
use v5.36;

srand 1;

my ($j, @list1, @list2);

min_index_sum(["Perl", "Raku", "Love"], ["Raku", "Perl", "Hate"]);
min_index_sum(['A', 'B', 'C'], ['D', 'E', 'F']);
min_index_sum(['A', 'B', 'C'], ['C', 'A', 'B']);

# make a longer example - 100 random letters in each list
for $j (0 .. 99) {
	$list1[$j] = chr(ord('a') + int(rand(26)));
	$list2[$j] = chr(ord('a') + int(rand(26)));
}	
min_index_sum(\@list1, \@list2);
	
sub min_index_sum {

	my (@list1, @list2, $j, %index, $least, $rubric1, $sum, $index1, $index2);
	
	@list1 = @{$_[0]};
	@list2 = @{$_[1]};
	
	# make index of first occurrence of word in @list1 - eg $index{"Raku"} == 1
	for $j (0 .. scalar @list1 - 1) {
		$index{$list1[$j]} = $j unless $index{$list1[$j]};
	}
	
	# scan through @list2
	$least = 10^6;
	$rubric1 = '';
	for $index2 (0 .. scalar @list2 - 1) {
		last if $index2 > $least;
		$index1 = $index{$list2[$index2]};
		
		# is this $list2 word in @list1?
		if (defined $index1) {
			$sum = $index1 + $index2;
			next if $sum > $least;
			
			# found a lesser sum of indices
			$rubric1 = '' if $sum < $least;
			$least = $sum;
			$rubric1 .= qq["$list2[$index2]", ];
		}
	}
	
	# show the answers
	say qq[\nInput:  \@list1 = ("] . join('", "', @list1) . q[")];
	say qq[        \@list2 = ("] . join('", "', @list2) . q[")];
	say qq[Output: (] . substr($rubric1, 0, -2) . q[)];	
}	

