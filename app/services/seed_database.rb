# frozen_string_literal: true

class SeedDatabase
  def self.execute
    seed_authors
    seed_roles
  end

  def self.seed_authors
    file = File.open('app/data/shows_with_authors.json')
    parsed_data = JSON.parse(file.read)
    parsed_data.each do |datum|
      author = Author.find_or_initialize_by(author_code: datum['author_code'])
      author.update(
        first_name: datum['first_name'],
        last_name: datum['last_name']
      )

      show = Show.find_or_initialize_by(show_code: datum['show_code'], name: datum['show_name'])
      show.authors << author
      show.save
    end
  end

  def self.seed_roles
    file = File.open('app/data/shows_with_roles.json')
    parsed_data = JSON.parse(file.read)

    parsed_data.each do |datum|
      show = Show.find_or_create_by(show_code: datum['show_code'], name: datum['show_name'])
      Role.find_or_create_by(show: show, name: datum['role_name'])
    end
  end
end
