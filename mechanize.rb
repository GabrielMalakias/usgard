require 'ruby-jmeter'

test do
  threads count: 10, duration: 30 do
    visit name: 'Usgard', url: 'http://localhost:2300'
  end
end.jmx(file: './tmp/testplan.jmx')

