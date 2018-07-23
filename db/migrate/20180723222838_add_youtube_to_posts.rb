class AddYoutubeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :youtube, :string
  end
end
