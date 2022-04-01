#!/usr/bin/env raku

use MONKEY-SEE-NO-EVAL;

#unit sub MAIN(Int $S, *@C where @C.all ~~ Int);

my $S = 6; my @C = <1 2 4>;

my $eval = "my \@results;\n";

for ^@C -> $i {
my $sum-str = (map { "\$v$_" }, 0..$i).join(" + ");
my $out-str = (map { "\@C[$_] x \$v$_ div \@C[$_]" }, 0..$i).join(",\n");

$eval ~= q :to/END/;        
loop (my $v\qq[$i] = 0; $v\qq[$i] <= $S; $v\qq[$i] += @C[\qq[$i]]) {
@results.unshift: [\qq[$out-str]] if \qq[$sum-str] == $S;
next if \qq[$sum-str] >= $S;

END
}

$eval ~= "}" x @C;
$eval ~= "\nsay .join for \@results;";
$eval ~= "\nsay \"\\n\", @results.elems, \" combinations\";"; 

EVAL $eval;
