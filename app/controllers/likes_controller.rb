class LikesController < ApplicationController
    
  
    def create
        @report = Report.new
        @like = current_user.likes.new(like_params)
        respond_to do |format|
            if @like.save
              @post = @like
              @like_class = @post.likeable.class.to_s === "Comment"
            
              format.html { redirect_to post_path(params[:post_id]), notice: "Comment was successfully created." }
              format.json { render :show, status: :created, location: @like }
              format.js
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @like.errors, status: :unprocessable_entity }
              format.js
            end
        end
    end

    def destroy
         @report = Report.new

        @like = current_user.likes.find(params[:id])
        @post = @like
        @like_class = @post.likeable.class.to_s === "Comment"
        @like.destroy

        respond_to do |format|
            format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
            format.json { head :no_content }
            format.js
        end
        

    end

    private
    def like_params
        params.require(:like).permit(:likeable_id,:likeable_type)
    end
   
end
