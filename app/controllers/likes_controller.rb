class LikesController < ApplicationController


    def create
        # find object with association_object_name: id in string
        @like = Like.find_by(like_params)
        if @like
            flash[:alert] = 'You liked before!'
        else
            @like = Like.create(status_id: params[:like][:status], user_id: params[:like][:user])
            flash[:notice] = "You liked #{@like.status.title}!"
        end
        redirect_to root_path
    end

    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        flash[:notice] = 'You unlike.'
        redirect_to status_path(@like.status)
    end

    private

    def like_params
        params.require(:like).permit(:status, :user)
    end

end
