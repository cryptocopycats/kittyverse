# Using the CryptoKitties Unofficial (v0 and Official (v1) Public APIs



## The "Unofficial" Public API (v0) - No API Token Required

### Getting the Statistics for all Cattributes (incl. Purrstiges)


### Getting the Kitten #1, #2, ...


## The Official Public API, Version 1 (v1) - API Token Required - Apply Here

Note: The Official Public API requires an (authorization) token.
Request to sign up for the KittyVerse program 
at <https://docs.api.cryptokitties.co> 
and if all works out the CryptoKitties team will send you over an API token via email. 
Good luck.


Add the token to your computing environment:

SET KITTIES_TOKEN=<your_token_here>

or configure the 

Kitties.configure do |config|
  config.token = "<your_token_here>"
end

or pass the token into the client:

c = Kitties::V1::Client.new( token: "<your_token_here>" )


### Getting the Statistics for all Cattributes (excl. Purrstiges)


### Getting the Kitten #1, #2, ...


