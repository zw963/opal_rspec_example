require 'test_another_class'

describe OpalClassToBeTested do
  subject { OpalClassToBeTested.new('bill', 'thompson') }

  it 'should to test an attribute' do
    subject.full_name.should == 'bill thompson'
  end

  it 'should be able test a function' do
    subject.year_born_if_this_old(10).should == Date.today.year - 10
  end
end
