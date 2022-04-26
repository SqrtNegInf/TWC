#!/usr/bin/env raku

BEGIN die 'not ok - disabled: JVM cannot handle concurrency' if $*VM ~~ /jvm/;

my %*SUB-MAIN-OPTS = :named-anywhere;

#| Display Help information
multi sub MAIN ( Bool :h(:$help) where so * ) {
    say $*USAGE;
}

subset FileExists of Str where { $_.IO.e && $_.IO.f };   

#| Work out the reverse index for the given documents
multi sub MAIN (
    @documents = <sample.txt sample1.txt sample2.txt>
) {
    my $min-length = 3;
    my %index;
    my $word-channel = Channel.new;
    my @promises;
    
    for @documents -> $path {
        @promises.push(
            start {
                my $res-path = $path.IO.resolve.Str;
                for $path.IO.words -> $word is copy {
                    $word ~~ s:g!<[\W]>!!;
                    next unless $word.chars >= $min-length;
                    $word-channel.send( ( $word.fc, $res-path ) );
                }
            }
        );
    }
    
    my $reactor = start react {
        whenever $word-channel -> ( $word, $path ) {
            %index{$word} //= SetHash.new;
            %index{$word}.{$path} = True;
        }
    }
    await @promises;
    $word-channel.close;
    await $reactor;
    
    %index = %index.map( { $_.key => $_.value.keys } );
    say("$_:{ %index{$_}.keys.join(",") }") for %index.keys.sort;
}

