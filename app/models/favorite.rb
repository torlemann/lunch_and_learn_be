class Favorite < ApplicationRecord
    validates :api_key,
        :presence => {message: "can't be blank"}
    validates :recipe_link,
        :presence => {message: "can't be blank"}
    validates :recipe_title,
        :presence => {message: "can't be blank"}
    validates :country,
        :presence => {message: "can't be blank"}
end
