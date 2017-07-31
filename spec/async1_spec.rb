describe 'async' do
  subject do
    delay_with_promise 1 do
      42
    end
  end

  # 以上的 subject, 等价写法为:
  # subject do
  #   promise = Promise.new
  #   delay 1 do
  #     promise.resolve 42
  #   end
  #   promise
  # end

  it { is_expected.to eq 42 }
end
