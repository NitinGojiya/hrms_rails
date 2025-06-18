class AdminsController < ApplicationController
  include Authentication

  def index
    @user = Current.session.user
  end
  def leave
    @user = Current.session.user

    @leaves_pending = Leafe.pending.order(updated_at: :desc)
    @leaves_accept = Leafe.accept.order(updated_at: :desc)
    @leaves = Leafe.all.order(updated_at: :desc)
  end

  def leavea
  end
end
