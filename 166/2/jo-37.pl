#!/usr/bin/env perl
use v5.36;
use List::Util qw(max pairgrep);


my @D  = <dir_a dir_b dir_c dir_d>;
print_diff(\@D, dir_diff(@D));


### Implementation

# Build a hash with the file names found in any directory as keys and an
# array indicating the files' presence within the directories.  Files
# contained in all directories are filtered out.  Equally named files
# and directories are regarded as different objects.  File contents are
# not compared.
sub dir_diff (@dirs) {
    my %files;
    # Loop over the directories.
    while (my ($i, $dir) = each @dirs) {
        opendir(my $dh, $dir);
        # Loop over the directory's files.
        while (readdir $dh) {
            # Append "/" to directories.
            $_ .= '/' if -d "$dir/$_";
            # Set an indicator for the current directory.
            $files{$_}[$i] = 1;
        }
        closedir $dh;
    }

    # Exclude files that exist in all directories.
    +{pairgrep {@dirs > grep $_, @$b} %files};
}

# Print the directory diff in a terse matrix format: "X" indicates the
# presence of a file in a directory.
sub print_diff ($dir, $diff) {
    my $dlen = max map length, @$dir;
    my $flen = max 0, map length, keys %$diff;

    # Table header
    printf "%${flen}s" . (" | %${dlen}s" x @$dir) . "\n",
        '', @$dir;
    printf "%${flen}s" . ("-+-%${dlen}s" x @$dir) . "\n",
        '-' x $flen, ('-' x $dlen) x @$dir;

    # Table rows
    for my $file (sort keys %$diff) {
        printf "%-${flen}s", $file;
        printf " | %${dlen}s", 'X' x !!$diff->{$file}[$_] for 0 .. $#$dir;
        print "\n";
    }
}
