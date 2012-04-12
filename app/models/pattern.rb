class Pattern < ActiveRecord::Base
  default_scope :order => 'title'
  has_many :line_works
  before_destroy :ensure_not_referenced_by_any_line_work
  
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
  
  private 
  
    # ensure that there are no line works referencing this pattern
    def ensure_not_referenced_by_any_line_work
      if line_works.empty?
        return true
      else
        errors.add(:base, 'Line Works present')
        return false
      end
    end
end
