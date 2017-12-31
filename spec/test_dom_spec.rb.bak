require 'jquery/dist/jquery.min'
require 'opal'
require 'opal-jquery'

describe 'DOM Testing' do
  it 'should see dom changes' do
    div = <<-'HEREDOC'
<div id="target-div">
  original text
</div>
HEREDOC

    # 我们可以使用 Element.parse 来建立这个 Dom 元素.
    div = Element.parse(div)
    # puts div.methods
    div.append_to_body

    d = Element.find('#target-div')
    expect(d.text).to match(/original text/)

    `document.getElementById('target-div').innerText = 'js replaced text'`
    expect(d.text).to match(/js replaced text/)
  end
end
