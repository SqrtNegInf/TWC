#!/usr/bin/env raku
use Test;

my @Test =
    [ [0,0,0,1], [0,0,0,1], [0,0,0,1],], 45,
    [ [0,0,1,1], [1,0,1,0], [1,1,0,0],], 39,
    [ [0],],                              1,
    [ [1,0], [0,1], [0,0],],              8,
    [ [1,0], [0,1], [1,0], [0,0],],      11,
    [ [0,0,1,1], [1,0,1,0], [1,1,0,0], [ 0,1,0,1],], 48,
    [ [0,1,0,1,1], [1,0,1,1,0], [1,1,0,0,1], [ 0,1,0,0,1],], 107,
    [ [0,0,0,0,1], [1,0,0,0,0], [0,0,0,0,0], [ 1,0,0,0,1],], 94,
;

plan @Test ÷ 2;

sub max-row-base2( @m -->Int) {
    my @mat = @m.raku.EVAL;
    for @mat -> @row {
        if @row[0] == 0 { invert @row;}
    }
    for ^@mat[0] -> $c {
        my @col := bind-col( @mat, $c);
        if +@col.grep(1) < +@col.grep(0) { invert @col; }
    }
    return [+] @mat.map( { parse-base .join, 2});

        sub invert( @a -->Nil) { for @a -> $e is rw { $e = (!$e.Bool).Int }}
}

sub bind-col( @m, $col-num -->Array) {
    my @col;
    @col[$_] := @m[$_][$col-num] for ^@m;
    @col
}

# A very stupid, stupid brute.  Was I redundent?
# 
# Every row and column is named.  Rows use their index and columns are
# named with the @matrix.end + the value of the index into @matrix[0].
# Permute this list; go thru each list; toggle each column or row; update
# score and repeat.  Quit early if theoretical best score is found.
sub brute( @matrix -->Int) {
    my $ct = 0;
    my @mat = @matrix.raku.EVAL;
    my $theo-best = theo-best(@mat);
    my $best = score( @mat);
    my @plan = ( ^(@mat.elems +@mat[0])).Array.permutations;
    for @plan -> @p {
        my @m = @mat;
        for @p -> $id {
            toggle( $id, @m);
            my $s = score @m;
            $best = $s if $best < $s;
        }
        return $best if $best == $theo-best;
    }
    return $best;

    sub score( @m -->Int) { [+] @m.map: {parse-base .join, 2 }}
    sub theo-best( @m -->Int) { @m.elems × ( 2**@m[0].elems - 1) }
}

sub toggle( UInt $id, @a -->Nil) {
    if is-row( @a, $id) {
        for ^@a[0] -> $i {
            @a[$id][$i] = (!@a[$id][$i].Bool).Int;
        }
    } else {
        my $cid = $id - @a.elems;
        for ^@a -> $r {
            @a[$r][$cid] = (!@a[$r][$cid].Bool).Int;
        }
    }
                sub is-row( @m, UInt $i -->Bool) { $i < @m.elems }
}

for @Test -> @in, $exp {
   is max-row-base2( @in), $exp, "$exp <-\t@in.raku()";
#  is brute( @in), $exp, "$exp <-\t@in.raku()";
}

done-testing;

my @matrix = [ [0,0,1,1], [1,0,1,0], [1,1,0,0], ];
my $preface = "Input: @matrix = [";

print "\n$preface [";
print @matrix.join( "],\n " ~ (' ' x $preface.chars) ~ '[' );
say "], ]" ~ "\nOutput: &max-row-base2( @matrix)";
