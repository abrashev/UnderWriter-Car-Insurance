require 'test_helper'

class QuotationTest < ActiveSupport::TestCase
 test "should not save post without title" do
  quote = Quotation.new
  assert !quote.save
end

end
