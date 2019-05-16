# Using the CryptoKitties Unofficial (v0) and Official (v1) Public APIs



## The Unofficial V0 Public API - No API Token Required

### Getting the Statistics for all Cattributes


### Getting the Kitten #1, #2, ...


## The Official V1 Public API - API Token Required - Apply Here

Note: The Official Public API requires an (authorization) token.
Request to sign up for the KittyVerse program 
at <https://docs.api.cryptokitties.co> 
and if all works the CryptoKitties team will send over an API token via email. 
Good luck.


Add the token to your computing environment:

SET KITTIES_TOKEN=<your_token_here>

or configure the 

Kitties.configure do |config|
  config.token = "<your_token_here>"
end

or pass the token into the client:

c = Kitties::V1::Client.new( token: "<your_token_here>" )


