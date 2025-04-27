# This form builder will detect error messages, add aria-invalid to the input,
# and append errors as helper text. Be sure to add any form helpers you use to this builder.

class InlineErrorFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(attribute, options = {})
    return super(attribute, options) if object.errors.none?

    opts = options.merge(aria: { invalid: object.errors[attribute].any? })
    super(attribute, opts) + error_helper_text(attribute)
  end

  def text_area(attribute, options = {})
    return super(attribute, options) if object.errors.none?

    opts = options.merge(aria: { invalid: object.errors[attribute].any? })
    super(attribute, opts) + error_helper_text(attribute)
  end

  private

  def error_helper_text(attribute)
    errors = object.errors[attribute]
    return unless errors.any?

    first, *rest = errors
    message = ["#{attribute.capitalize} #{first}", *rest].to_sentence
    ApplicationController.helpers.content_tag(
      :small,
      message,
      id: field_id(object, attribute)
    )
  end
end
