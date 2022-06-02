#!/usr/bin/env raku
#my @dirs = <dir_a dir_b dir_c dir_d>;
my @dirs = map {$_ ~~ /\w+$/}, dir("./test-dir");
my %dircontent;
for @dirs -> $dir {
    %dircontent{$dir} = map {~($_ ~~ /\w+$/)}, dir("./test-dir/$dir");
}
say "Content of the dirs: ", %dircontent;
my $intersection = [∩] values %dircontent;
say "Files common to all directories: ", $intersection.keys;
for @dirs -> $dir {
    say "$dir -> ", grep {$_ ∉ $intersection}, values %dircontent{$dir};
}
