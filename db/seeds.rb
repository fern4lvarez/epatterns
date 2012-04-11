Pattern.delete_all

Pattern.create(:title => 'Ethnic',
  :description =>
    %{<p>
      Feel the shapes of our origins.
    </p>},
  :image_url => '/images/pattern01.png',
  :price => 0.99)

Pattern.create(:title => 'Africa',
  :description =>
    %{<p>
      The heart of Africa wherever you want.
    </p>},
  :image_url => '/images/pattern02.png',
  :price => 0.99)

