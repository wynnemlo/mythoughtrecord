module API

  class ThoughtrecordsController < APIController
    acts_as_token_authentication_handler_for User

    before_action :set_thoughtrecord, only: [:show, :update, :destroy]
    before_action :authenticate_user!, except: [:create]
    before_action :require_creator, except: [:index, :create]

    def index
      if user_signed_in?
        @thoughtrecords = Thoughtrecord.where(creator: current_user.id)
      end
    end

    def create
      @thoughtrecord = Thoughtrecord.new(thoughtrecord_params)
      @thoughtrecord.creator = current_user

      if @thoughtrecord.save
        render json: {
          success: "true"
        }, status: 201
      else
        render json: {
          errors: @thoughtrecord.errors.full_messages
        }, status: 422
      end
    end

    def show
      render json: @thoughtrecord, status: 200
    end

    def update
      if @thoughtrecord.update(thoughtrecord_params)
        render json: @thoughtrecord, status: 200
      else
        render json: {
          errors: @thoughtrecord.errors.full_messages
        }, status: 422
      end
    end

    def destroy
      @thoughtrecord.destroy
      render json: {
          success: "true"
        }, status: 200
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
end