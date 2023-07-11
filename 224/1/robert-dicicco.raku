#!/usr/bin/env raku

my $flag = 0;
my $offset = 0;

sub MAIN ($source = "scriptinglanguage", $target = "perl") {
    while $offset < $target.chars {
        my $letter = substr($target, $offset, 1);
        unless $source.contains($letter) {
            say "Output: false";
            $flag = -1;
            last;
        }
        $offset++;
    }
    if ($flag == 0) {
        say "Output: true";
    }
}
