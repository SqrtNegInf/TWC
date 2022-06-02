#!/usr/bin/env raku

#sub MAIN( Str $dir-a, Str $dir-b, Str $dir-c ) {

    my @dirs = <dir_a dir_b dir_c>;
    my %files;

    # build the directory content
    for @dirs -> $current-dir {
        %files{ $_.basename  ~ ( $_.d ?? '/' !! '' ) }.push: $current-dir for $current-dir.IO.dir( test => { $current-dir.IO.d || $current-dir.IO.f } );
    }


    # print the stuff
    my $header = False;
    #for %files.kv -> $file-name, $dir-names {
    for %files.keys.sort -> $file-name {
        my $dir-names = %files{$file-name};
        # skip all entries that are there for all the directories!
        next if %files{ $file-name }.elems == @dirs.elems;

        "|%-20s|%-20s|%-20s|\n|%s|%s|%s|".sprintf( @dirs, ( '-' x 20 ) xx @dirs.elems ).say and $header = True if ! $header;
        printf "|%-20s", $dir-names.grep( $_ ) ?? $file-name !! ' '         for @dirs;
        print "|";

        say "";
    }

#}
