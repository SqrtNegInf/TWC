#!/usr/bin/env raku

use Digest::SHA;#256::Native;
use Test;

constant $b58chars = '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz';

sub MAIN(Str $addr="1AGNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62i") {
    my  $byte =0;
    my $c=0;
    my @address=$addr.comb;
    my $chksum = buf8.allocate(4,0);
    my $bytes = buf8.allocate(25,0);
        for ^@address.elems -> $i {
            $c=index($b58chars,@address[$i]); # add next base 58 number to existing sum
            for (^$bytes).reverse -> $j {
                $c+=58 * $bytes[$j];
                $bytes[$j] = $c mod 256; # take lower byte
                $c=$c div 256; # take upper byte
            }
            say "Invalid: Address too long" and exit if $c>0;
        }
$chksum=$bytes.subbuf(*-4);
    my $double_sha256 = sha256(sha256($bytes.subbuf(0..20)));
    say "Invalid" and exit if $chksum !~~ $double_sha256.subbuf(^4);
    say "Valid";
};
