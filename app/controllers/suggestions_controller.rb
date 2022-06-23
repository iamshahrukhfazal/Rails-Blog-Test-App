class SuggestionsController < ApplicationController

    def index
        @suggestion = Suggestion.all
    end
    def index 
        @post = Post.find(params[:post_id])
        @suggestions = @post.suggestions
        @isUserPost = @post.user.id === current_user.id
    end
    def create
        
        @suggestion = current_user.suggestions.new(suggestion_params)
        respond_to do |format|
            if @suggestion.save
              @post = @suggestion.post
              format.html { redirect_to post_path(params[:post_id]), notice: "Comment was successfully created." }
              format.json { render :show, status: :created, location: @suggestion }
              format.js
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @suggestion.errors, status: :unprocessable_entity }
              format.js
            end
        end
    end
    def update 
        @suggestion = Suggestion.find(params[:id])
        
        respond_to do |format|
            if @suggestion.update({"status"=>suggestion_params[:status]})
              format.html { redirect_to post_url(@suggestion), notice: "Post was successfully updated." }
              format.json { render :show, status: :ok, location: @suggestion }
              format.js
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @suggestion.errors, status: :unprocessable_entity }
              format.js
            end
          end
    end
    def destroy
        @suggestion = current_user.suggestions.find(params[:id])
        @post_suggestion = @suggestion
        @suggestion.destroy
        respond_to do |format|
            format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
            format.json { head :no_content }
            format.js
        end
    end
    private
    def suggestion_params
     
        params.require(:suggestion).permit(:status,:content,:id)
        .merge(post_id:params[:post_id])

    end


    def isValidUser 
        
    end

end
