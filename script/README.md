# Scripts

## Update Cattributes Stats

Step 1: Save a copy of 
<https://api.cryptokitties.co/cattributes>
to the /dl folder with today's date added to the filename.

Example: `dl/cattributes-2020-01-12.json`

Note: Beware of browser caching - go into the debug / dev console
and to the network tab and click on 'Disable cache'. Reload to get a up-to-date (fresh) copy.

Step 2: Convert JSON to CSV using the `script/convert_cattributes.rb` script.

Change the input filename and than run:

   $ ruby script/convert_cattributes.rb

to get an updated copy in `datasets/cattributes.csv`.

Step 3: Generate a new up-to-date CATTRIBUTES.md page

Run:

    $ ruby -I ./lib script/cattributes.rb


