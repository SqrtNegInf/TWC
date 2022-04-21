#!/usr/bin/env raku

sub MAIN(
    @files = [<example.txt>]
) {
    my %totals;

    if @files.elems {
        for @files -> $file {
            $file.IO.lines.map({ %totals{$_}++; });
        }
    } else {
        $*IN.lines.map({ %totals{$_}++; });
    }

        my $width =
            %totals.keys.sort({$^b.chars <=> $^a.chars}).first.chars;

        %totals.keys.sort.map({
            printf("% -*s  %s\n", $width, $_, %totals{$_});
        });
}
