class StatusesController < ApplicationController

    def index
    end

    def show
        @status = Status.find(params[:id])
    end

    def new
        @status = Status.new
    end

    def create
        @status = Status.new(status_params)

        if @status.save
            flash[:notice] = 'Status is created successfully.'
            redirect_to @status
        else
            flash[:alert] = 'Error creating status.'
            render :new
        end
    end

    def edit
        @status = Status.find(params[:id])
    end

    def update
        @status = Status.find(params[:id])
        if @status.update(status_params)
            flash[:notice] = 'Status is updated successfully.'
            redirect_to @status
        else
            flash[:alert] = 'Error updating status.'
            render :edit
        end
    end

    def destroy
        @status = Status.find(params[:id])
        @status.destroy
        flash[:notice] = "Status is deleted."
        redirect_to statuses_path
    end

    private

    # def find_status
    #     @status = Status.find(params[:id])
    # end

    def status_params
        params.require(:status).permit(:title, :content, :user_id)
    end

end