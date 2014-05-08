class Post < ActiveRecord::Base
	has_paper_trail
	
	belongs_to :user
	belongs_to :post_category
	belongs_to :location

	acts_as_commentable
	#acts_as_likeable

	has_attached_file :attached_document, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "missing.jpg"

	validates_attachment_content_type :attached_document, :content_type => /\Aimage\/.*\Z/
end
