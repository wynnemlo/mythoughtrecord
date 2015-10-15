class ThoughtrecordsController < ApplicationController
  before_action :set_thoughtrecord, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  before_action :require_creator, only: [:edit, :update, :destroy]

  def index
    if user_signed_in?
      @thoughtrecords_for_user = Thoughtrecord.where(creator: current_user.id)
      @thoughtrecords = @thoughtrecords_for_user.limit(Thoughtrecord::PER_PAGE).offset(params[:offset])
      if !@thoughtrecords.blank?
        @pages = (@thoughtrecords_for_user.size / Thoughtrecord::PER_PAGE)
        @pages += 1 if (@thoughtrecords_for_user.size % Thoughtrecord::PER_PAGE) > 0
        # if there is a remainder then add 1 to page number
      else
        @pages = 0
      end
    end
  end

  def new
    @thoughtrecord = Thoughtrecord.new
  end

  def create
    @thoughtrecord = Thoughtrecord.new(thoughtrecord_params)
    @thoughtrecord.creator = current_user

    if @thoughtrecord.save
      flash['notice'] = "Your record has been successfully added."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @thoughtrecord.update(thoughtrecord_params)
      flash['notice'] = "Your record has been successfully updated."
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @thoughtrecord.destroy
    redirect_to root_path
  end

  private

  def set_thoughtrecord
    @thoughtrecord = Thoughtrecord.find(params[:id])
  end


  def thoughtrecord_params
    params.require(:thoughtrecord).permit(:situation, :feelings, :unhelpfulthoughts, :supportingfacts, :disprovingfacts, :altperspective, :outcome)
  end

  def require_creator
    access_denied unless user_signed_in? and (current_user == @thoughtrecord.creator)
  end

end