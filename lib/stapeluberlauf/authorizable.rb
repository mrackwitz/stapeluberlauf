module Stapeluberlauf
  module Authorizable
    # @return [String]
    #   The secret key of the OAuth app which allows to authorize to increased throttle
    #   quota and privileged access to user data.
    #   Must be set in combination with an #acess_token.
    #   If you don't have a request key you can obtain one by [registering your
    #   application on Stack Apps](http://stackapps.com/apps/oauth/register).
    attr_accessor :key

    # @return [String]
    #   The OAuth access token which allows to authorize to increased throttle
    #   quota and privileged access to user data.
    #   Must be set in combination with a #key.
    #          
    attr_accessor :access_token
    
    # Authorize a request with an access token and key.
    #
    # @param [String] key  @see #key
    #
    # @param [String] access_token  @see #access_token
    #
    # @return [Self] returns the receiver to support a floating API
    #
    def authorize(key, access_token)
      self.key = key
      self.access_token = access_token
      return self
    end
    
    # Returns whether all credentials are sufficiently set
    # to execute authorized requests.
    #
    def authorized?
      !key.nil? && !access_token.nil?
    end
  end
end
