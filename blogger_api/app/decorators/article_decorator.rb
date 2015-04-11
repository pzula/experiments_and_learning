class ArticleDecorator < Draper::Decorator
  # delegate_all

    def to_json(option ={})
      if context[:role] == :admin
        object.to_json
      else
        object.to_json(only: :title)
      end
    end

    def to_xml(option ={})
      if context[:role] == :admin
        object.to_xml
      else
        object.to_xml(only: :title)
      end
    end




  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
