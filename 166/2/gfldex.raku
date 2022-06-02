#!/usr/bin/env perl6
# from https://gfldex.wordpress.com/2022/05/25/reducing-sets/

    sub basename(IO::Path $_) { .basename ~ (.d ?? '/' !! '') }
    sub pad(Str $_, $width, $padding = ' ') { .Str ~ $padding x ($width - .chars) }

    sub dir(Str $name) {
        sub mock-file(*@names) { @names.map({ IO::Path.new($_) but role :: { method f ( --> True ) {}; method e ( --> True ) {} } } ) }
        sub mock-dir(*@names) { @names.map({ IO::Path.new($_) but role :: { method d ( --> True ) {}; method e ( --> True) {} } }) }

        constant %dirs = dir_a => flat(mock-file(<Arial.ttf Comic_Sans.ttf Georgia.ttf Helvetica.ttf Impact.otf Verdana.ttf>), mock-dir(<Old_Fonts>)),
                         dir_b => mock-file(<Arial.ttf Comic_Sans.ttf Courier_New.ttf Helvetica.ttf Impact.otf Tahoma.ttf Verdana.ttf>),
                         dir_c => mock-file(<Arial.ttf Courier_New.ttf Helvetica.ttf Impact.otf Monaco.ttf Verdana.ttf>);

        %dirs{$name}
    }

    sub dir-diff(+@dirs) {
        my @content = @dirs».&dir».&basename;
        my @relevant = (([∪] @content) ∖ [∩] @content).keys.sort;

        my @columns = @content.map(-> @col { @relevant.map({ $_ ∈ @col ?? $_ !! '' }) });
        my $col-width = [max] @columns[*;*]».chars;

        put @dirs».&pad($col-width).join(' | ');
        put (''.&pad($col-width, '-') xx 3).join('-+-');
        .put for ([Z] @columns)».&pad($col-width)».join(' | ');
    }

    dir-diff(<dir_a dir_b dir_c>);
