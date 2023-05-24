#!/usr/bin/env perl
use v5.36;

use Compress::Zlib;
use MIME::Base64;

print uncompress 
      decode_base64
      q/eJxTUFBQiAMBLhBDAQRATAgLzIYxyeYgG4ZsB5LFcBF0GrsKANslHl8=/;

