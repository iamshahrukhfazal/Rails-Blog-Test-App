class ReportsController < ApplicationController
    

    def create
        @report = current_user.reports.new(report_params)
        respond_to do |format|
            if @report.save
            
              @post = @report.reportable

              format.html { redirect_to post_path(params[:post_id]), notice: "Comment was successfully created." }
              format.json { render :show, status: :created, location: @report }
              format.js
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @report.errors, status: :unprocessable_entity }
              format.js
            end
        end
    end
    
    def destroy
        @report = current_user.reports.find(params[:id])
        @post = @report.reportable
        @report.destroy
        respond_to do |format|
            format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
            format.json { head :no_content }
            format.js
        end
    end
    private
    def report_params
        params.require(:report).permit(:reportable_id,:reportable_type,:report_status)
    end

end
