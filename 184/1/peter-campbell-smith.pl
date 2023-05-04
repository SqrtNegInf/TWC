#!/usr/bin/env perl
use v5.36;

my (@lists, $list_ref, @list, $old_show, $new_show, $j);

# inputs
@lists = (['ab1234', 'cd5678', 'ef1342'], ['pq1122', 'rs3334']);

# loop over inputs
while ($list_ref = shift @lists) {
	@list = @$list_ref;
	$old_show = $new_show = '';

	# loop over list elements
	for $j (0 .. scalar @list - 1) {
		$old_show .= qq['$list[$j]', ];
		$new_show .= qq['] . sprintf('%02d%s', $j, substr($list[$j], 2)) . qq[', ];
	}
	
	# show the answer
	say qq[\nInput:  (] . substr($old_show, 0, -2) . qq[)] .
		qq[\nOutput: (] . substr($new_show, 0, -2) . qq[)];
}
