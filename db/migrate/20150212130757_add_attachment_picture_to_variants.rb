class AddAttachmentPictureToVariants < ActiveRecord::Migration
  def self.up
    change_table :variants do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :variants, :picture
  end
end
