#!/usr/bin/env raku

sub MAIN(@files = ['input-list.txt']) {
    my @addr;

    ## if no files on the commandline, look for lines coming in from STDIN
    if @files.elems {
        @addr.append( .IO.lines ) for @files;
    }
    else {
        @addr = $*IN.lines;
    }

    ## filter unique items after applying lowercase to domain
    #@addr .= unique(:as(&{ S:i/(\@.*$)/{lc($/)}/ })) if $u;

    ## sort by lowercased domain then by mailbox
    my @sorted = @addr.sort(&{.substr(.index("@")+1).lc, .substr(0,(.index("@")))});

    .say for @sorted;
}
