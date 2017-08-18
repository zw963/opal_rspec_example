require 'opal'
require 'opal-jquery'

describe 'DOM Testing' do
  div = <<-'HEREDOC'
<div id="target-div">
  original text
</div>
HEREDOC

  # 我们可以使用 Element.parse 来建立这个一个 Dom 元素.
  div = Element.parse(div)
  div.append_to_body

  d = Element.find('#target-div')
  expect(d.text).to =~ /original test/

  `document.getElementById('target-div').innerText = 'js replaced text'`
  expect(d.text).to =~ /js replaced text/
end
