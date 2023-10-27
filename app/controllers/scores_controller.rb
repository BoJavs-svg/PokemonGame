class ScoresController < ApplicationController
    def scoreboard
        @users = User.order(points: :desc)
      end
end
