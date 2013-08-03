require 'i18n_exist.rb'

class StandartBuilder < ActionView::Helpers::FormBuilder
  def error_messages(opts = { attribute_name: true })
    return unless object.respond_to?(:errors) && object.errors.any?
		key = "models." + object.class.name.downcase
		header_name = I18n.exist?(key) ? I18n.t(key) : object.class.name
	  header = @template.content_tag(:h4, @template.t('can_not_save', count: @template.pluralize(object.errors.count, "error"), object_name: header_name))
    if opts[:attribute_name]
      errors_list = object.errors.full_messages.map { |message| @template.content_tag(:li, message) }
    else
      errors_list = object.errors.map { |attr, message| @template.content_tag(:li, message) }
    end
    errors_list = @template.content_tag(:ul, errors_list.join("\n").html_safe)
    @template.content_tag(:div, (header + "\n" + errors_list).html_safe, id: "error_explanation")
  end
end
