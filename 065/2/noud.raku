#!/usr/bin/env raku

sub all-partitions-weak($S) {
    if ($S.chars == 1) {
        return [[$S],];
    }

    my @ret = [[$S],];
    for 1..($S.chars - 1) -> $i {
        for $i..($S.chars - 1) -> $j {
            my $s1 = $S.substr(0, $i);
            my $s2 = $S.substr($j, $S.chars);
            for all-partitions-weak($s2) -> $r {
                @ret.push([$s1, |($r)]);
            }
            @ret.push([$s1]);
            @ret.push([$s2]);
        }
    }

    return @ret;
}

sub all-partitions-strong($S) {
    if ($S.chars == 1) {
        return [[$S],];
    }

    my @ret = [[$S],];
    for 1..($S.chars - 1) -> $i {
        my $s1 = $S.substr(0, $i);
        my $s2 = $S.substr($i, $S.chars);
        for all-partitions-strong($s2) -> $r {
            @ret.push([$s1, |($r)]);
        }
    }

    return @ret;
}

sub all-palindrome(@A) {
    for @A -> $a {
        if (not $a.flip eq $a) {
            return False;
        }
    }
    return True;
}

say 'Weak palindromes:';
all-partitions-weak('aabaab').grep({ all-palindrome($_ ); }).say;
all-partitions-weak('abbaba').grep({ all-palindrome($_ ); }).say;

say 'Strong palindromes:';
all-partitions-strong('aabaab').grep({ all-palindrome($_ ); }).say;
all-partitions-strong('abbaba').grep({ all-palindrome($_ ); }).say;

# With the extra restriction of at least two characters for a palindrome.

sub at-least-two(@A) {
    for @A -> $a {
        if ($a.chars < 2) {
            return False;
        }
    }
    return True;
}

say 'Weak palindromes (len > 1):';
all-partitions-weak('aabaab').grep({
    all-palindrome($_ ) and at-least-two($_);
}).say;
all-partitions-weak('abbaba').grep({
    all-palindrome($_ ) and at-least-two($_);
}).say;

say 'Strong palindromes (len > 1):';
all-partitions-strong('aabaab').grep({
    all-palindrome($_ ) and at-least-two($_);
}).say;
all-partitions-strong('abbaba').grep({
    all-palindrome($_ ) and at-least-two($_);
}).say;
