require 'omniauth-oauth2'

module OmniAuth
    module Strategies
        class Twitch < OmniAuth::Strategies::OAuth2
          option :client_options, {
            :site => 'https://api.twitch.tv/kraken',
            :authorize_url => 'https://api.twitch.tv/kraken/oauth2/authorize',
            :token_url => 'https://api.twitch.tv/kraken/oauth2/token'
          }

          def request_phase
            super
          end

          def authorize_params
            super.tap do |params|
              %w[scope client_options].each do |v|
                if request.params[v]
                  params[v.to_sym] = request.params[v]
                end
              end
            end
          end

          uid { raw_info['_id'].to_s }

          info do
            {
              'displayname' => raw_info['display_name'],
              'email' => email,
              'profileURL' => "http://www.twitch.tv/users/#{raw_info['display_name']}"
            }

            extra do
              {:raw_info => raw_info}
            end

            def raw_info
              access_token.options[:mode] = :query
              @raw_info ||= access_token.get('user').parsed
            end

            def email
              (email_access_allowed?) ? primary_email : raw_info
            end

end
