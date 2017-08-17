require 'test_one_class'
require 'native'

describe 'JsClassToBeTested' do
  let(:user) { Native(`new JsClassToBeTested('bill', 'thompson')`) }

  it 'shuld be able to test an attribute' do
    user.fullName.should == 'bill thompson'
  end
end
