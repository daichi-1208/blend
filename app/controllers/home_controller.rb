class HomeController < ApplicationController

    def top
        @themes = Theme.where(is_active: true)
    end
end
