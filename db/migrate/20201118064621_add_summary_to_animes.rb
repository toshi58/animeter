class AddSummaryToAnimes < ActiveRecord::Migration[6.0]
  def change
    add_column :animes, :summary, :text
  end
end
