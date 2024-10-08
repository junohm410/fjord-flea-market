# frozen_string_literal: true

class UsersController < ApplicationController
  def destroy
    user = User.find(params[:id])
    user.destroy!
    redirect_to root_path, notice: '退会しました'
  end
end
