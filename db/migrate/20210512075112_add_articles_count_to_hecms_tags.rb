class AddArticlesCountToHecmsTags < ActiveRecord::Migration[6.1]
  def change
    add_column :hecms_tags, :articles_count, :integer
  end
end
