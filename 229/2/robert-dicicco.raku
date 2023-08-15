#!/usr/bin/env raku

my @arrays = ([1, 1, 2, 4,],[2, 4],[4]);
#my @arrays = ([4, 1],[2, 4],[1, 2]);

my %hash = ();
my $cnt = 1;
my (@array1,@array2,@array3) = ();

sub CreateCounts(@a) {
    for @a -> $i {
        if (defined (%hash{$i})) {
            %hash{$i}++;
        } else {
            %hash{$i} = 1;
        }
    }
}

for (@arrays) -> @a {
    my @a_uniq = @a.unique;
    if ($cnt == 1) {
        @array1 = @a_uniq;
        CreateCounts(@array1);
        say "Input:  \@array1 = ",@array1;
    } elsif ($cnt == 2) {
        @array2 = @a_uniq;
        CreateCounts(@array2);
        say "\t\@array2 = ",@array2;
    } elsif ($cnt == 3) {
        @array3 = @a_uniq;
        CreateCounts(@array3);
        say "\t\@array3 = ",@array3;
    } else {
        print("ERROR!");
        exit;
    }
    $cnt++;
}

print("Output: ( ");
for %hash.keys.sort -> $key { if %hash{$key} >= 2 { print("$key "); }
#or %hash.kv -> $key, $val { if %hash{$key} >= 2 { print("$key "); }
}

print(" \)");
