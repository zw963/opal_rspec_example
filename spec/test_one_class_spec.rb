require 'test_one_class'
require 'native'
require 'date'

describe 'JsClassToBeTested' do
  let(:user) { Native(`new JsClassToBeTested('bill', 'thompson')`) }

  it 'shuld be able to test an attribute' do
    user.fullName.should == 'bill thompson'
  end

  it 'should be able to test a function' do
    user.yearBornIfThisOld(10).should == Date.today.year - 10
  end
end
