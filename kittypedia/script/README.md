# Scripts

## Update Cattributes Stats

Step 1: Save a copy of
<https://api.cryptokitties.co/cattributes>
to the /dl folder with today's date added to the filename.

Example: `dl/cattributes-2021-01-30.json`

``` json
[
   {"description":"totesbasic",  "type":"pattern",      "gene":15, "total":"408249"},
   {"description":"thicccbrowz", "type":"eyes",         "gene":7,  "total":"309267"},
   {"description":"pouty",       "type":"mouth",        "gene":9,  "total":"287510"},
   {"description":"happygokitty","type":"mouth",        "gene":14, "total":"263531"},
   {"description":"kittencream", "type":"colortertiary","gene":6,  "total":"255855"},
   ...
]
```

Note: Beware of browser caching - go into the debug / dev console
and to the network tab and click on 'Disable cache'. Reload to get a up-to-date (fresh) copy.





Step 2: Convert JSON to CSV using the `script/convert_cattributes.rb` script.

Change the input filename and than run:

   $ ruby script/convert_cattributes.rb

to get an updated copy in `datasets/cattributes.csv`.

Step 3: Generate a new up-to-date CATTRIBUTES.md page

Run:

    $ ruby -I ./lib script/cattributes.rb


