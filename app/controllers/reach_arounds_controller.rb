class ReachAroundsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    if $reach_around
      redirect_to '/spots'
    else
      render :signin
    end
  end

  def make
    json = HTTParty.post('http://localhost:3000/authenticate', body: {email: params['email'], password: params['password']})
    if json["auth_token"]
      $reach_around = json["auth_token"]
      redirect_to '/spots'
    else
      redirect_to '/signin'
    end
  end

  def new_user
    json = HTTParty.post('http://localhost:3000/user', body: {user: {email: params['email'], password: params['password']}})
    if json.code == 201
      redirect_to '/signin'
    else
      redirect_to '/signup'
    end
  end

  def signup
    render :new_user
  end

end
