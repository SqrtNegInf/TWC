#!/usr/bin/env raku

use Test;

my @Test =
    # source                indices             resul;
    (0, 1, 2, 3, 4),        (0, 1, 2, 2, 1),    (0, 4, 1, 3, 2),
    (1, 2, 3, 4, 0),        (0, 1, 2, 3, 0),    (0, 1, 2, 3, 4),
    (1,),                    (0,),                (1,),
    (4, 3, 2, 1),           (0, 0, 0, 0),       (1, 2, 3, 4),
    (4, 3, 2, 1),           (0, 0, 0, 1),       (2, 1, 3, 4),
    (4, 3, 2, 1),           (0, 0, 1, 0),       (1, 3, 2, 4),
;
my @Dimmed-test =
    (4, 3, 2, 1),           (1, 0, 0, 0),       (1, 2, 3, 4),
    (4, 3, 2, 1),           (2, 0, 0, 0),       (1, 2, 3, 4),
    (4, 3, 2, 1),           (3, 0, 0, 0),       (1, 2, 3, 4),
    (4, 3, 2, 1),           (3, 2, 0, 0),       (1, 2, 3, 4),
    (4, 3, 2, 1),           (2, 0, 3, 0),       (1, 3, 4, 2),
;
plan (@Test × 2 + @Dimmed-test) ÷ 3;

# unconstrained arrays
sub splice-one-in( @list, $start, $new-value --> Array ) {
    sink splice(@list, $start, 0, $new-value);
    @list;
}

sub reindex( @value, @splice-idx -->Array) {
    my @ret;
    for ^@splice-idx -> \i {
        splice-one-in @ret, @splice-idx[i], @value[i];
    }
    @ret;
}


# shaped arrays allow starting anywhere
sub insert( @s, Any:D $value, Any(Int) $loca ) {
    without @s[$loca] {
        @s[$loca] = $value;
        return;
    }
    my $k = @s[ (1 + $loca)..^@s].first( ! *.defined, :k);  # 'empty' index
    die "ERROR inserting $value at $loca; cannot move occupant."
        without $k;
    $k += $loca + 1;    # adjust for with slice's offset
    @s[ $loca..$k] = flat $value, @s[$loca..^$k];   # insert w/ moving others
    return;
}

sub shaped-reindex( @value, @index -->Array) {
    my @ret[ @value.elems];
    for ^@index -> \i {
        insert @ret,  @value[i], @index[i];
    }
    @ret;
}

for @Test -> $source, $splice-dest, $exp {
   is reindex($source, $splice-dest), $exp, "$exp <- $source « $splice-dest";
   is shaped-reindex($source, $splice-dest), $exp,
        "$exp <- $source.raku() « $splice-dest.raku() shaped";
}
for @Dimmed-test -> $source, $splice-dest, $exp {
   is shaped-reindex($source, $splice-dest), $exp,
        "$exp <- $source.raku() « $splice-dest.raku() shaped";
}

done-testing;

exit;

