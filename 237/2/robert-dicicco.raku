#!/usr/bin/env raku

my @mynums = ([1, 3, 5, 2, 1, 3, 1], [1, 2, 3, 4]);

my $maxscore = 0;
my $score = 0;
my @output = [];

sub CalcScore (@a,@b) {
    my $cnt = 0;
    my $score = 0;
    while ($cnt < @a.elems) {
        if (@a[$cnt] < @b[$cnt]) {
            $score++;
        }
        $cnt++;
    }
    return $score;
}

for @mynums -> @nums {
    say "Input: \@nums = ",@nums;
    $maxscore = 0;
    my @sec = @nums;
    for @sec.permutations -> @perm {
        $score = 0;
        $score = CalcScore(@nums, @perm);
        my $ignore = floor(@nums.elems / 2 + 1);
        if ($score >= $maxscore and $score >= $ignore) {
            $maxscore = $score;
        }
    }
    say "Output: $maxscore\n";
}
