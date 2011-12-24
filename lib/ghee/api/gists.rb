class Ghee

  # API module encapsulates all of API endpoints
  # implemented thus far
  #
  module API

    # The Gists module handles all of the Github Gist
    # API endpoints
    #
    module Gists

      # Gists::Proxy inherits from Ghee::Proxy and
      # enables defining methods on the proxy object
      #
      class Proxy < ::Ghee::ResourceProxy

        # Creates gist
        #
        # attributes - Hash of attributes
        #
        # Returns json
        #
        def create(attributes)
          connection.post(path_prefix, attributes).body
        end

        # Patches gist
        #
        # attributes - Hash of attributes
        #
        # Returns json
        #
        def patch(attributes)
          connection.patch(path_prefix, attributes).body
        end

        # Star a gist
        #
        # Returns true/false
        #
        def star
          connection.put("#{path_prefix}/star").status == 204
        end

        # Unstar a gist
        #
        # Returns true/false
        #
        def unstar
          connection.delete("#{path_prefix}/star").status == 204
        end

        # Returns whether gist is starred
        #
        # Returns true/false
        #
        def starred?
          connection.get("#{path_prefix}/star").status == 204
        end

        # Get public gists
        #
        # Returns json
        #
        def public
          connection.get("#{path_prefix}/public").body
        end

        # Get starred gists
        #
        # Returns json
        #
        def starred
          connection.get("#{path_prefix}/starred").body
        end

        # Deletes a gist
        #
        # Returns true/false
        #
        def destroy
          connection.delete(path_prefix).status == 204
        end
      end

      # Get gists
      #
      # id - String of gist id
      #
      # Returns json
      #
      def gists(id=nil)
        path_prefix = id ? "/gists/#{id}" : '/gists'
        Proxy.new(connection, path_prefix)
      end
    end
  end
end