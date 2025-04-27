module ApplicationHelper
  def form_with_inline_errors(**options, &block)
    options[:builder] = InlineErrorFormBuilder
    form_with(**options, &block)
  end
end
