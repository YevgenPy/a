class NewslettersController < ApplicationController
  class NewslettersController < ApplicationController
    skip_before_action :authenticate_user!
    before_action :set_newsletter, only: [:destroy]

    def create
      @newsletter = Newsletter.create(newsletter_params)
      if @newsletter.save
        redirect_to blog_index_path
      else
        redirect_to root_path
      end
    end

    private

    def set_newsletter
      @newsletter = Newsletter.find(params[:id])
    end

    def newsletter_params
      params.require(:newsletter).permit(:name, :email)
    end

  end
end
