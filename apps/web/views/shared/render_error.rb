module Web::Views::Shared
  module RenderError
    def render_error(messages)
      html.div(class: 'row') do
        ul do
          messages.map do |error|
            li(class: 'collection-item red-text text-darken-4') do
              error
            end
          end
        end
      end
    end
  end
end

