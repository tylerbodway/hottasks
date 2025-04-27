# Disable auto-wrapping fields with div.fields_with_error
# https://guides.rubyonrails.org/active_record_validations.html#customizing-error-field-wrapper

ActionView::Base.field_error_proc =
  proc { |html_tag, instance| html_tag.html_safe }
