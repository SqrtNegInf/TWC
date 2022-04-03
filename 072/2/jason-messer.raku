#!/usr/bin/env raku
sub MAIN($fname = 'input.txt', $first_line = 3, $last_line = 6) {
	my $fh = open $fname, :chomp(False) or die($fh);
	$fh.lines($first_line - 1).eager;
	my $n = $last_line - ($first_line - 1);
	for ($fh.lines($n)) { .print }
}
