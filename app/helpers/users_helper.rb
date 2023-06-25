module UsersHelper
    def role
        User.roles.keys.map do |role|
            [t("activerecord.attributes.User.roles.#{role}"), role]
        end
    end
end
