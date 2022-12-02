class ChangeDataTypeForFieldname < ActiveRecord::Migration[7.0]
  def change
    change_table :articles do |t|
      t.change :cover_url, :text
    end
  end
end
