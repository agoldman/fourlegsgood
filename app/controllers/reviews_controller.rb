class ReviewsController < ApplicationController
	def index
		@reviews_of_me_as_a_sitter
		@reviews_of_my_pets
		@my_reviews_of_other_sitters
		@my_reviews_of_other_pets
	end
end
