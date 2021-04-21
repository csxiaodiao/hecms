# frozen_string_literal: true

class CreateHecmsPictures < ActiveRecord::Migration[6.1]
  def change
    create_table :hecms_pictures, &:timestamps
  end
end
