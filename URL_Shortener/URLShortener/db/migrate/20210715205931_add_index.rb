class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :shorten_urls, :short_url, unique: true
  end
end
