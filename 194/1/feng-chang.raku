#!/usr/bin/env raku

unit sub MAIN(Str:D \tms = '2?:00');

put (9...0).first({
    try { "2022-02-22T{ tms.trans('?' => ~$_) }:00Z".DateTime }
    $_ unless $!
});
