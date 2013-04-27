class ItemPurchase < ActiveRecord::Base
	attr_accessible :item_store_id, :price_per_unit, :purchase_id, :quantity, :status, :unit, :actual_storage_location
	
	# Callbacks
	# handles setting the actual_storage_location to be the associated item's storage location
  before_create :set_default_item_location
	# callback to handle setting the storage_location_overridden boolean to be true when the actual_storage_location gets saved/changed
  # changed from after_update to before_save
  # before_update :record_location_change
	
	
    # Constants
    STATUSES = { 3 => 'just_bought_it', 
    			 2 => 'still_have_some',
    			 1 => 'almost_out', 
    			 0 => 'all_gone' }


	# Relationships
	belongs_to :purchase
	belongs_to :item_store
	has_one :item, :through => :item_store

    # Validations
  #     validates_presence_of :quantity
  #     validates_presence_of :unit          
  #     validates_presence_of :price_per_unit
  #     validates_presence_of :status
  # validates_numericality_of :quantity, :greater_than => 0
	

	# Scopes
	scope :by_quantity, order('quantity')
	scope :alphabetical_by_name, joins(:item).order('name')
	scope :alphabetical_by_generic_name, joins(:item).order('generic_name')
	scope :by_status, order('status')

	# orders item_purchases by their purchase date
	scope :chronological, joins(:purchase).order('date')
	
	# retrieve items based on the passed in location value for their storage location
	scope :stored_in, lambda{|location| where('actual_storage_location = ?', location)}
    
    # get items that have a given status
	scope :for_status, lambda { |status| where('status = ?', status) }
    
    # get all item_purchases for an item
    scope :for_item, lambda {|item_id| joins(:item_store).where('item_id = ?', item_id)}
   
    # returns all item_purchases belonging to a specific customer
    scope :for_customer, lambda {|customer_id| joins(:purchase).where('customer_id = ?', customer_id)}
  
    # returns all items belonging to a specific purchase
    scope :for_purchase, lambda {|purchase_id| where('purchase_id = ?', purchase_id)}

    # get all of the item purchases for a given store
    scope :for_store, lambda{|store_id| joins(:item_store).where('item_stores.store_id = ?', store_id)}

    # get item_purchases from a given date range
    scope :for_date_range, lambda {|start_date, end_date| joins(:purchase).where('date BETWEEN ? AND ?', start_date.to_date, end_date.to_date) }


    # Methods
    # turn the numeric status into a human readable string
    def status_to_s
    	STATUSES[self.status].humanize
    end

    # get the name of the item by looking at the associated item record
    def name
    	self.item.name
    end
    

    # def self.get_market_share(store_id, start_date, end_date)
    #   market_share = {}
    #   items = Item.all
    #   items.each do |item|
    #     # call helper
    #     market_share_for_item = ItemPurchase.get_item_market_share(item.id, store_id, start_date, end_date)
    #     # save market share to hash
    #     market_share[item.name] = market_share_for_item
    #   end
    #   return market_share
    # end
    # 
    # # static (class) method which returns a hash of items mapped to the percent of the items bought at the given store
    # # (TODO - this could be optimized to make fewer database queries)
    # def self.get_item_market_share(item_id, store_id, start_date, end_date)
    #   # get all of the item_purchase records in this date range (this is the total)
    #   all_purchases = ItemPurchase.for_item(item_id).for_date_range(start_date, end_date).all
    # 
    #   # get all the item_purchase records for this store (this is what we'll divide by the total)
    #   this_store_purchases = ItemPurchase.for_item(item_id).for_date_range(start_date, end_date).for_store(store_id).all
    # 
    #   # unless no one bought this item anywhere in this time range
    #   unless all_purchases.length == 0
    #     # return the proportion of purchases of this item that were made at this store
    #     market_share = this_store_purchases.length / all_purchases.length.to_f
    #     return market_share
    #   # no purchases made
    #   else
    #     return 'None purchased in this time period at any store.'
    #   end
    # end

    private
    # these are mostly callback methods
    def set_default_item_location
    	self.actual_storage_location = self.item.storage_location
    end
    
    # only changes if locaiton is differnt
    def record_location_change
      if (self.actual_storage_location != self.item.storage_location)
    	  self.update_attribute(:location_overridden, true)
  	  end
    end

end
