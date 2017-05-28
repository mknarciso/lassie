class CreateTestimonies < ActiveRecord::Migration
  def change
    create_table :testimonies do |t|
      t.string :tweet_id
      t.string :in_response_to_id
      t.text :content

      t.timestamps null: false
    end
  end
end
