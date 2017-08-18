describe 'async' do
  # 注意 promise 可以在 subject 之中被调用.
  # 但是无法在 let 中使用, 因为 let 是 lazy 的.
  subject do
    promise = Promise.new
    delay 0 do
      promise.resolve 42
    end
    promise
  end

  # 注意: 这里的验证一定是在上面的 promise 被 resolve 之后.
  # 验证得到的返回值, 因此验证他是一个 Promise 失败.
  # it { is_expected.to be_a Promise }        # 这个失败.

  # 验证 reslove 之后, 返回的值, 成功.
  it { is_expected.to eq 42 }
end

describe '上面的等价写法, 更简单.' do
  # 为了方便, opal-rspec 提供了 delay_with_promise, 和上面的等价.
  subject do
    delay_with_promise 0 do
      42
    end
  end

  it { is_expected.to eq 42 }
end
