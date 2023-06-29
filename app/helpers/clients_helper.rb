module ClientsHelper
    def client_states_helper
        Client.client_states.keys.map do |client_state|
            [t("activerecord.attributes.Client.client_states.#{client_state}"), client_state]
        end
    end
end
