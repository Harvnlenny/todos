class Item < ActiveRecord::Base
  belongs_to :list
  
  def self.completion
    no_completed_items = true
    items = Item.all
    items.each do |item|
      if item.is_complete
        no_completed_items = false
      end
    end
      !no_completed_items
  end

  def self.search(word)
    where (["LOWER(task) LIKE ?", "%#{word.downcase}%"])
  end
  

  

end


