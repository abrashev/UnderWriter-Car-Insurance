class User < ActiveRecord::Base
validates_presence_of :title,:firstname, :surname,:dateofbirth,:licenceperiod,:occupation_id
validates_numericality_of :phone
has_many :quotations, dependent: :destroy
has_many :incidents, dependent: :destroy
has_one :user_detail, dependent: :destroy
has_one :address, dependent: :destroy
belongs_to :occupation
accepts_nested_attributes_for :address
accepts_nested_attributes_for :user_detail
accepts_nested_attributes_for :incidents, allow_destroy: true

  def firstname=(value)
    write_attribute :firstname, (value ? value.humanize : nil)
  end

  def self.per_page
    3
  end
  
  def surname=(value)
    write_attribute :surname, (value ? value.humanize : nil)
  end
  
  
end
