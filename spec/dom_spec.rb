# require 'jquery-1.12.4.min'
# require 'jquery-migrate-1.4.1.min'
require 'zepto.min'
require 'opal'
require 'opal-jquery'

describe 'DOM Testing' do
  it 'should see dom changes' do
    div = <<-'HEREDOC'
<div id="target-div">
  original text
</div>
HEREDOC

    # 我们可以使用 Element.parse 来建立这个一个 Dom 元素.
    div = Element.parse(div)
    # puts div.methods
    div.append_to_body

    d = Element.find('#target-div')
    expect(d.text).to =~ /original test/

    `document.getElementById('target-div').innerText = 'js replaced text'`
    expect(d.text).to =~ /js replaced text/
  end
end
