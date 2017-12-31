# 关于老式写法和新式写法的理解:

# 老式写法, 通过 async 和 run_async 这种方式, 将异步的执行方式, 使用一种很直白的
# 的方式描述了出来.

# 而新的写法, 通过 Promise, 统一了新的写法和老的写法, 无需新的语法支持,
# 只要 subject 返回一个 promise, 稍后的测试, 就会自动判断, 如果这个是一个
# Promise, 则会等待这个 Promise resolve 之后, 再执行验证.

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


  # 注意: 这里的验证, 一定是在上面的 promise 被 resolve 之后, 验证得到的返回值,
  # 因此, 虽然 subject 返回的是 promise,  但是实际上验证的是 resolve 之后的返回值.
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

describe '老式的写法, 现在仍被支持' do
  # 需要使用新的写法: async 来表示, 这里 spec 将要执行异步测试.
  async "can test async javascript" do

    # 但是, 仍然可以验证同步的代码.
    puts 'starting async'
    `var foo = 1`
    # you can assert values on js
    expect(`foo`).to eq 1


    # 注意: 异步运行的代码中必须调用 run_async { ... } 来通知这个 spec 已经执行完成(resolved),
    # 否则会报错: `Specs timed out', 而 { ... } 之中的代码, 会异步的在后台执行,
    # 这种写法, 可以针对异步正在执行的任务增加 spec
    # async 会等待该 block 执行完成之后, 返回验证的结果.
    %x| setTimeout( function()
                     { console.log('in timeout');
                       foo = 2;
                       #{run_async { expect(`foo`).to eq 2} }
                      }, 10 )
    |
  end

  async 'HTTP requests should work' do
    HTTP.get('http://www.baidu.com') do |res|
      run_async {
        # 不知道为啥不成功, 稍后再解决.
        # 注意, 这里的代码运行上下文和 run_async 代码块外面是同一个上下文.
        # 唯一不同的是, 这里的代码被延迟执行, 即: 异步代码执行完成之后才执行.
        puts '----', res.body, '-----'
        expect(res).to be_ok
      }
    end
  end
end
