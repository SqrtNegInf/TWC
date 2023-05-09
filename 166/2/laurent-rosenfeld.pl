#!/usr/bin/env perl
use v5.36;

my @dirs = glob("./test-dir/*");
my $nb_dirs = scalar @dirs;
my %dircontent;
for my $dir (@dirs) {
    $dircontent{$dir} = [ map {/(\w+$)/} glob "$dir/*" ];
}
say "Contents of the directories: ";
for my $dir (@dirs) {
    say "$dir: ", join " ", @{$dircontent{$dir}}
}

my %files;
for my $dir (@dirs) {
    $files{$_}++ for @{$dircontent{$dir}}
}
say "\nCommon files: ", join " ", grep { $files{$_} == $nb_dirs } keys %files;
say "\nFiles not common to all directories: ";
for my $dir (@dirs) {
    say "$dir: ", join " ", grep { $files{$_} < $nb_dirs } @{$dircontent{$dir}};
}
