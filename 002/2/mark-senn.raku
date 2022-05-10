#!/usr/bin/env raku

my $input  = -37;
my $base35 = $input.base(35);
my $output = $base35.parse-base(35);

print qq:to/END/;
input  was $input
base35 is  $base35
output is  $output
END
