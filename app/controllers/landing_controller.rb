class LandingController < ApplicationController
    skip_before_action :authenticate_user!
    before_action :check_login, only: :index
    
  def index
    @coinlists = Cryptocompare::CoinList.all["Data"] 
  end    


    def lookup
        
        @lookup_coin= Cryptocompare::CoinList.all["Data"] 
        @price_info = Cryptocompare::Price.full(:Raw =>'BTC')
         
        @symbol = params[:sym]
            if @symbol
                @symbol = @symbol.upcase
            end
            
            if @symbol == ""
             @symbol ="No symbol or ticker entered!"
            end
            
    end 
    

private

    def check_login
        if user_signed_in?
            redirect_to browse_posts_path
        end
    end
end
