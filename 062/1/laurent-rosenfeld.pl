#!/usr/bin/env perl
use v5.36;

sub normalize {
    my $addr = shift;
    my ($box, $domain) = split /@/, $addr;
    return (uc $domain . "@" . $box);
}
my ($unique, @files);
my $first_param = 0;
if ($first_param eq "-u") {
    $unique = 1;
    @files = @ARGV;
} else {
    $unique = 0;
    @files = ('input-list.txt');
}
my @addresses;
for my $file(@files) {
    open my $IN, "<", $file or die "Unable to open $file";
    push @addresses, <$IN>;
}
chomp @addresses;
my @sorted = map { $_->[0] }
    sort { $a->[1] cmp $b->[1] }
    map { [$_, normalize $_] } @addresses;
if ($unique) {
    my $last = "";
    @sorted = grep { my $bool = $last ne normalize $_; $last = normalize $_; $bool} @sorted;
}
say for @sorted;
