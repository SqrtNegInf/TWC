#!/usr/bin/env perl
use v5.36;

my @args = '../00-blogs';
my $counter = {};

for my $file ( @args ) {
    if (! -f $file) { die "argument $file is not a valid file "};
    open (my $fh, "<", "$file") || die "file read error: \'$file\' cannot be opened";
    local $/ = undef;       ## locally set the line separator to undef so we slurp the entire file
    my $text = <$fh>;
    close $fh;

    my @letters = grep {/[a-z]/} split //, lc($text);
    for my $letter ( @letters ){
        $counter->{$letter}++;
    }
}

## output the hash
for my $key (sort keys $counter->%*)    {
    printf "%3s: %-d\n", $key, $counter->{$key};

}
