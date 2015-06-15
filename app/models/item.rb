class Item < ActiveRecord::Base
  belongs_to :list
  
  def self.has_dates
    no_due_dates = true
    items = Item.all
    items.each do |item|
      unless item.due_date.blank?
        no_due_dates = false
      end
    end
    !no_due_dates
  end


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


