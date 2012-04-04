require 'test_helper'

class PatternTest < ActiveSupport::TestCase
  test "pattern attributes must not be empty" do
    pattern = Pattern.new
    assert pattern.invalid?
    assert pattern.errors[:title].any?
    assert pattern.errors[:description].any?
    assert pattern.errors[:image_url].any?
    assert pattern.errors[:price].any?
  end
  
  test "pattern price must be positive" do
    pattern = Pattern.new(:title       => "Pattern",
                          :description => "One pattern",
                          :image_url   => "pattern.png") 
    pattern.price = -1
    assert pattern.invalid?
    assert_equal "must be greater than or equal to 0.01",
      pattern.errors[:price].join('; ')
      
    pattern.price = 0
    assert pattern.invalid?
    assert_equal "must be greater than or equal to 0.01",
      pattern.errors[:price].join('; ')
      
    pattern.price = 1
    assert pattern.valid?
  end
  
  test "image url" do
    ok = %w{ patt.gif patt.jpg patt.png PATT.JPG PATT.Jpg /img/Patt.gif }
    bad = %w{ patt.doc patt.pdf patt.png.txt }
    
    ok.each do |name|
      assert new_pattern(name).valid?, "#{name} shouldn't be invalid"
    end
    
    bad.each do |name|
      assert new_pattern(name).invalid?, "#{name} shouldn't be valid"
    end
  end
  
  
  
end
