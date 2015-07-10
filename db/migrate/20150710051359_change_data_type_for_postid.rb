class ChangeDataTypeForPostid < ActiveRecord::Migration
  def change
    change_column :posts, :postid, :text
  end
end
