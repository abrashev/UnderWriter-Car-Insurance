class Quotation < ActiveRecord::Base
validates_presence_of :policyexcess,:breakdowncover,:excesspaid
#validates_numericality_of :quotepremium, greater_than_or_equal_to: 20
belongs_to :user
has_one :vehicle, dependent: :destroy
accepts_nested_attributes_for :vehicle
@@search_columns = ["identification"]
before_save :calculatepremium


def calculatepremium
#http://stackoverflow.com/questions/88311/how-best-to-generate-a-random-string-in-ruby
	require 'securerandom'
	s = SecureRandom.urlsafe_base64(7)
	self.identification=s
	#puts s	 
	 #puts self.vehicle.value*self.breakdowncover
	 #self.user_id=self.quotation_user_id
	 @myincidents=Incident.where(user_id: self.user_id).count
  #puts @myincidents
 if(Integer(self.breakdowncover)>1)
	self.quotepremium=(self.vehicle.value*Integer(self.breakdowncover))/100  
	end
	if(self.windscreenrepair==true)
	
	self.quotepremium+=30
	end
	
	if (@myincidents==0)
	@discount=(self.quotepremium*30)/100
	self.quotepremium=self.quotepremium-@discount
	
	end
	 
end

def self.search_columns
    @@search_columns
  end
  
  def self.searchable_by(*column_names)
    @@search_columns = []
    [column_names].flatten.each do |name|
      @@search_columns << name
    end
  end

  def search(query, fields=nil, options={})
    with_scope find: {
        conditions: search_conditions(query, fields)} do
      find :all, options
    end
  end

  def self.search_conditions(query, fields=nil)
    return nil if query.blank?
    fields ||= @@search_columns

    # Split the query by commas as well as spaces, just in case
    words = query.split(",").map(&:split).flatten

    binds = {} # Query binding names for substitution to avoid SQL injection!
    or_frags = [] # OR fragments
    count = 1 # To help give bind symbols a unique name
    #cols = columns_hash() # All the column objects
    #puts "columns= #{cols}"

    words.each do |word|
      search_frags = [fields].flatten.map do |field|
        # If a string field then construct a LIKE frag
        # else if a numeric field then look for equality
        #puts "field= #{field}"
        #column = cols[field.to_s]
        #puts "column before = #{column}"
        #unless column.blank?
        #if column.text?
        "LOWER(#{field}) LIKE :word#{count}"
        #elsif column.
        #end
        #end
      end
      or_frags << "(#{search_frags.join(" OR ")})"
      binds["word#{count}".to_sym] = "%#{word.to_s.downcase}%"
      count += 1
    end
    puts "search conditions: #{[or_frags.join(" AND "), binds].to_s}"
    [or_frags.join(" AND "), binds]
  end
  
end
