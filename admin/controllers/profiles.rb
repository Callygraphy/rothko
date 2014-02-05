Emergence::Admin.controllers :profiles do
  get :index do
    @title = "Profiles"
    @profiles = Profile.all
    render 'profiles/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'profile')
    @profile = Profile.new
    render 'profiles/new'
  end

  post :create do
    @profile = Profile.new(params[:profile])
    if @profile.save
      @title = pat(:create_title, :model => "profile #{@profile.id}")
      flash[:success] = pat(:create_success, :model => 'Profile')
      params[:save_and_continue] ? redirect(url(:profiles, :index)) : redirect(url(:profiles, :edit, :id => @profile.id))
    else
      @title = pat(:create_title, :model => 'profile')
      flash.now[:error] = pat(:create_error, :model => 'profile')
      render 'profiles/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "profile #{params[:id]}")
    @profile = Profile.get(params[:id])
    if @profile
      render 'profiles/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'profile', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "profile #{params[:id]}")
    @profile = Profile.get(params[:id])
    if @profile
      if @profile.update(params[:profile])
        flash[:success] = pat(:update_success, :model => 'Profile', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:profiles, :index)) :
          redirect(url(:profiles, :edit, :id => @profile.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'profile')
        render 'profiles/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'profile', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Profiles"
    profile = Profile.get(params[:id])
    if profile
      if profile.destroy
        flash[:success] = pat(:delete_success, :model => 'Profile', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'profile')
      end
      redirect url(:profiles, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'profile', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Profiles"
    unless params[:profile_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'profile')
      redirect(url(:profiles, :index))
    end
    ids = params[:profile_ids].split(',').map(&:strip)
    profiles = Profile.all(:id => ids)
    
    if profiles.destroy
    
      flash[:success] = pat(:destroy_many_success, :model => 'Profiles', :ids => "#{ids.to_sentence}")
    end
    redirect url(:profiles, :index)
  end
end
