#!/usr/bin/env perl
use v5.36;

my ($m, $n, $col_width, $j, $k, $term, %terms, $line, $count) = (5, 5);

# get params
#print qq[m: ]; $m = <> + 0;
#print qq[n: ]; $n = <> + 0;
print qq[\nInput: \$m = $m, \$n = $n\nOutput:\n\n];

# calculate column width = width of largest term + 1
$col_width = int(log($m * $n)/log(10)) + 1;

# print top row and underline
print sprintf(" %${col_width}s", 'x') . ' |';
for $j (1 .. $n) {
	print sprintf(" %${col_width}d", $j);
}
print qq[\n];
print '-' x ($col_width + 2) . '+' . '-' x (($col_width + 1) * $n) . "\n";

# print other rows
for $j (1 .. $m) {
	print sprintf(" %${col_width}d", $j) . ' |';
	for $k (1 .. $n) {
		$term = $j * $k;
		print sprintf(" %${col_width}d", $term);
		$terms{sprintf('%08d', $term)} = 1;   # pad to 8 digits to make them sort correctly
	}
	print qq[\n];
}

# print unique terms
for $term (sort keys %terms) {
	$line .= ($term + 0) . ', ';
	$count ++;
}

print qq[\nDistinct terms: ] . substr($line, 0, -2) . qq[\nCount: $count\n\n];
