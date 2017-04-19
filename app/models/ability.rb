class Ability
  include CanCan::Ability

  def initialize(user)
    unless user.nil?
      can :create, Note
      can [:read, :update], Note, user_id: user.id
      can :read, Note do |note|
        user.readable.include?(note)
      end
    end
  end
end
