#!/usr/bin/env raku

say 'temperature.txt'.IO.lines
                  .sort
                  .rotor(2 => -1)
                  .grep({ .[0].match(/\d+$/) < .[1].match(/\d+$/) })
                  .map( { .[1].match(/<[\d-]>+/) })
                  .join("\n");
