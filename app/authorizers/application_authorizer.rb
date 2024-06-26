# Other authorizers should subclass this one
class ApplicationAuthorizer < Authority::Authorizer
  # Any class method from Authority::Authorizer that isn't overridden
  # will call its authorizer's default method.
  #
  # @param [Symbol] adjective; example: `:creatable`
  # @param [Object] user - whatever represents the current user in your app
  # @return [Boolean]
  def self.default(_adjective, user)
    user.has_role? :admin
  end

  # To update a specific resource instance, you must either own it or be an admin
  def updatable_by?(user)
    resource.user_id == user.id || user.has_role?(:admin)
  end

  def deletable_by?(user)
    resource.user_id == user.id || user.has_role?(:admin)
  end
end
