module ClientsHelper
    def client_state
        Client.client_states.keys.map do |client_state|
            [t("activerecord.attributes.Client.client_states.#{client_state}"), client_state]
        end
    end
end
