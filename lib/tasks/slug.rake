namespace :slug do
  desc "TODO"
  task slugify: :environment do
    Painting.find_each do |painting|
      downcase = painting.title.downcase
      # [^a-z 0-9]+ means to remove anything that isnt alphanumeric or a space
      clean = downcase.gsub(/[^a-z 0-9]+/, "")
      slug = clean.gsub(/\s/, "_")
      painting.slug = slug
      painting.save
    end
  end

end
