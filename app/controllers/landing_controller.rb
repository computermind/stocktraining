class LandingController < ApplicationController
    skip_before_action :authenticate_user!
    before_action :check_login, only: :index

private

    def check_login
        if user_signed_in?
            redirect_to browse_posts_path
        end
    end
end
