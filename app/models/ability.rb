class Ability
  include CanCan::Ability

  def initialize(account)
    account ||= Account.new

    if account.profile
      account.profile.profile_accesses.each do |profile_access|
        can profile_access.action.to_sym, profile_access.subject.constantize
      end
    else
      can :read, :all # Permisos para usuarios invitados
    end
  end
end