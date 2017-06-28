namespace :slug do
  desc "TODO"
  task slugify: :environment do
    Painting.find_each do |painting|
      downcase = painting.title.downcase
      clean = downcase.gsub(/ - /, "_")
      # [^a-z 0-9_]+ means to remove anything that isnt alphanumeric or a space
      extra_clean = clean.gsub(/[^a-z 0-9_]+/, "")
      slug = extra_clean.gsub(/\s/, "_")
      painting.slug = slug
      painting.save
    end
  end

end
