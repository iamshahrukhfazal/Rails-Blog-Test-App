class CommentsController < ApplicationController

    def create
    @report = Report.new

        @comment = current_user.comments.create(comment_params)
        
        respond_to do |format|
            if @comment.save
              @post = @comment.post
              format.html { redirect_to post_path(params[:post_id]), notice: "Comment was successfully created." }
              format.json { render :show, status: :created, location: @comment }
              format.js
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @comment.errors, status: :unprocessable_entity }
              format.js
            end
        end


        # if !@comment.save
        #     flash[:notice] = @comment.errors.full_messages.to_sentence 
        # end 

        # redirect_to post_path(params[:post_id]) 
    end

    private
    def comment_params
        params.require(:comments).permit(:content, :parent_id)
        .merge(post_id:params[:post_id])
    end

end
