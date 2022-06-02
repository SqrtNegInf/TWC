#!/usr/bin/env raku

multi sub MAIN( Str $dir-path = 'test-dir' ) {
    shallow-multi-dir-diff( $dir-path );
}

#multi sub MAIN( *@dir-name ) {
#    shallow-multi-dir-diff( @dir-name);
#}

# process all top-level dirs in given directory
multi sub shallow-multi-dir-diff( Str $dir-path ) {
    my @d = map *.Str, grep *.d, dir( $dir-path);
    shallow-multi-dir-diff( @d );
}

multi sub shallow-multi-dir-diff( @dir ) {
    my @header = @dir.sort;
    my @width;      # list for column width
    my %row;      # basename => count for building/ordering table

    my @path =  gather for @header -> $d { take $d.IO.dir; }
    @path = @path.flat[*;*];
    @path.map: { $_ = $_.d ?? ($_ ~ '/') !! $_.Str };

    my @base = @path.sort;
    @base.map: { $_ = $_.=subst: / ^ \w+ '/' /, '' };
    my @fn2dir = map {  my $a = my $b = $_;
                        $a=.subst( / ^ \w+ '/' /, '' );
                        $b=.subst( / '/' \w+ '/'? $ /, '' );
                        Pair.new: $a, $b;
    }, @path;

    %row = map { $_ => [ ' ', ' ', ' ' ] }, @base.unique;

    my %dir2col-num = @header.antipairs;
    my %dir2flist ;

    for @fn2dir.sort ->  (:key($name), :value($dir)) {
        %row{$name}[%dir2col-num{$dir}] = $name;
        %dir2flist{$dir}.push: $name;
    }
    for %dir2flist.kv -> $dir, @field {
        @width[ %dir2col-num{$dir} ] «max=« map *.chars, @field;
    }
    for %row.kv -> $name, @field {
        %row{$name} :delete if @field[0] eq @field.all;
    }
    _presentation( :@header, :@width, :%row);
}

sub _presentation( :@header, :@width is copy, :%row ) {
    my ( @line, @vert-sep);

    for 0 .. @width.end -> $col {
        @line.push: sprintf " %-@width[$col]s ", @header[$col];
        @vert-sep.push: sprintf "%-@width[$col]s", '-' x 2 + @width[$col];
    }
    say @line.join: '|';
    say @vert-sep.join: '|';

    for %row.keys.sort -> $row {
        my @diff-line;
        for 0 .. @width.end -> $col {
            @diff-line.push: sprintf " %-@width[$col]s ", %row{$row}[$col];
        }
        say @diff-line.join: '|';
    }
}
