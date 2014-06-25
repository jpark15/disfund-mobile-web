#helper methods
Capybara.add_selector(:tag_for) do
  css { |object| "##{dom_id(object)}" }
end

Capybara.add_selector(:row_for) do
  css { |object| "tr##{dom_id(object)}" }
end

Capybara.add_selector(:dd_for_label) do
  xpath { |label| ".//dt[label='#{label}']/following-sibling::dd[1]" }
end

Capybara.add_selector(:label_at_index) do
  xpath { |index| "//*[@id='main']/article/div/fieldset/dl/dt[#{index}]/label"}
end

Capybara.add_selector(:header_at_index) do
  xpath { |index| "//*[@id='table1']/thead/tr/th[#{index}]"}
end

Capybara.add_selector(:value_under_header) do
  xpath { |header| "//*[@id='table1']/tbody/tr/td[(count(//*[@id='table1']/thead/tr/th[.=\"#{header}\"]/preceding-sibling::*)+1)]"}
end
