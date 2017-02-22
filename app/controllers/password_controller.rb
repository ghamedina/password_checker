class PasswordController < ApplicationController
  def check
    @user_id = params[:user_id] unless params[:user_id].nil?
    @password = params[:password] unless params[:password].nil?

    regex = /[\!@#\{$%^&*\(\)-=_+;:'",\<.\>\/?}]/

    if @user_id.nil?
      @user_id = ""
    elsif @password.nil?
      @password = ""
    end
    #@user_id = "noorghamedi!"
    if (@user_id.nil?) || (@user_id == @password) || (@user_id =~ regex) || (@user_id.length < 6)
      flash.now[:notice] = "Your User ID is not valid."
    elsif
      flash.now[:alert] = "Your User ID is valid."
    end


    if (@password.nil?) || (@password.length < 6) || !(@password =~ regex) || (@user_id == @password) || !(@password =~ /\d/) || !(@password.downcase > @password && @password.upcase < @password)
      flash.now[:notice] = flash.now[:notice].to_s + " Your password is not valid."
    elsif
      flash.now[:alert] = flash.now[:alert].to_s + " Your password is valid."
    end


    # render('check.html.erb')

  end#closes checkmethod

end#closes class PasswordController

#In a browser use http://localhost:3000/check_password?userid=joe&password=letmein to check the credentials.
