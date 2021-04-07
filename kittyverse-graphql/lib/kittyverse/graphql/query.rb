
module Kittyverse
module GraphQL

  class Client


    #####
    #  generic query via HTTP POST
    BASE_URL = 'https://api.thegraph.com/subgraphs/name/nieldlr/cryptokitties-sales'

    def query( query, includes: [] )
      if includes.size > 0
        ## check for end-of-line comments with @INCLUDES marker
         query = query.gsub( /[#]+[ ]+@INCLUDES[^\n\r]+/,
                               includes.join( ' ' ) )
      end

      res = Webclient.post( BASE_URL, json: {
                                        query: query } )

      if res.status.nok?   ## e.g. != 200
        puts "!! ERROR: HTTP #{res.status.code} #{res.status.message}:"
        pp res.raw ## note: dump inner (raw) response (NOT the wrapped)
        exit 1
      end

      res.json  ## return body (utf-8 enconded text) parsed as json
    end
  end # class Client
end # module GraphQL
end # module Kittyverse


