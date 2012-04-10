class Pattern < ActiveRecord::Base
  default_scope :order => 'title'
  
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {
    :greater_than_or_equal_to => 0.01,
    :message                  => 'must be greater than or equal to 0.01.'
  }
  validates :title, :uniqueness => true
  validates :title, :length => {
    :maximum => 10,
    :message => 'must be at least ten characters long.'
  }
  validates :image_url, :format => {
    :with     => %r{\.(gif|jpg|png)$}i,
    :message  => 'must be a URL for GIF, JPG or PNG image.'
  }  
end
