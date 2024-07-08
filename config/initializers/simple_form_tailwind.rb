# frozen_string_literal: true

# Uncomment this and change the path if necessary to include your own
# components.
# See https://github.com/heartcombo/simple_form#custom-components
# to know more about custom components.
# Dir[Rails.root.join('lib/components/**/*.rb')].each { |f| require f }

# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  # Default class for buttons
  config.button_class = 'no-underline inline-flex items-center rounded-md px-3 py-2 text-sm font-semibold text-white shadow-smno-underline inline-flex items-center rounded-md px-3 py-2 text-sm font-semibold text-white shadow-sm'

  # Define the default class of the input wrapper of the boolean input.
  config.boolean_label_class = ''

  # How the label text should be generated altogether with the required text.
  config.label_text = ->(label, required, _explicit_label) { "#{label} #{required}" }

  # Define the way to render check boxes / radio buttons with labels.
  config.boolean_style = :inline

  # You can wrap each item in a collection of radio/check boxes with a tag
  config.item_wrapper_tag = :div

  # Defines if the default input wrapper class should be included in radio
  # collection wrappers.
  config.include_default_input_wrapper_class = false

  # CSS class to add for error notification helper.
  config.error_notification_class = 'text-white px-6 py-4 border-0 rounded relative mb-4 bg-error'

  # Method used to tidy up errors. Specify any Rails Array method.
  # :first lists the first message for each field.
  # :to_sentence to list all errors for each field.
  config.error_method = :to_sentence

  # add validation classes to `input_field`
  config.input_field_error_class = 'border-error'
  config.input_field_valid_class = 'border-amethyst'

  # vertical forms
  #
  # vertical default_wrapper
  config.wrappers :vertical_form, tag: 'div', class: 'mb-3' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'block', error_class: 'text-error'
    b.use :input, class: 'shadow appearance-none border border-neutral rounded w-full py-2 px-3 bg-snow focus:outline-none focus:ring-0 focus:border-purple text-black leading-6 transition-colors duration-200 ease-in-out', error_class: 'border-error', valid_class: 'border-amethyst'
    b.use :full_error, wrap_with: { tag: 'p', class: 'mt-2 text-error text-xs italic' }
    b.use :hint, wrap_with: { tag: 'p', class: 'mt-2 text-pink text-xs italic' }
  end

  # vertical input for textarea
  config.wrappers :vertical_form_with_div, tag: 'div', class: 'mb-3' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.wrapper tag: 'div', class: 'ml-3 text-sm' do |bb|
      bb.use :label, class: 'block', error_class: 'text-error'
      bb.use :hint, wrap_with: { tag: 'p', class: 'block text-pink text-xs italic' }
      bb.use :full_error, wrap_with: { tag: 'p', class: 'block text-error text-xs italic' }
    end
    b.wrapper tag: 'div', class: 'mt-2' do |ba|
      ba.use :input, class: 'block w-full rounded-md border-0 py-1.5 text-black shadow-sm ring-1 ring-inset ring-purple placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-purple sm:text-sm sm:leading-6'
    end
  end

  # vertical input for boolean
  config.wrappers :vertical_boolean, tag: 'div', class: 'mb-3 flex items-start', error_class: '' do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper tag: 'div', class: 'flex items-center h-5' do |ba|
      ba.use :input, class: 'focus:ring-2 focus:ring-pink ring-offset-2 h-4 w-4 text-pink border-neutral rounded'
    end
    b.wrapper tag: 'div', class: 'ml-3 text-sm' do |bb|
      bb.use :label, class: 'block', error_class: 'text-error'
      bb.use :hint, wrap_with: { tag: 'p', class: 'block text-pink text-xs italic' }
      bb.use :full_error, wrap_with: { tag: 'p', class: 'block text-error text-xs italic' }
    end
  end

  # vertical input for radio buttons and check boxes
  config.wrappers :vertical_collection, item_wrapper_class: 'flex items-center', item_label_class: 'my-1 ml-3 block text-sm font-medium text-neutral', tag: 'div', class: 'my-4' do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :legend_tag, tag: 'legend', class: 'text-sm font-medium text-neutral', error_class: 'text-error'  do |ba|
      ba.use :label_text
    end
    b.use :input, class: 'focus:ring-2 focus:ring-pink ring-offset-2 h-4 w-4 text-pink border-neutral rounded', error_class: 'text-error', valid_class: 'text-amethyst'
    b.use :full_error, wrap_with: { tag: 'p', class: 'block mt-2 text-error text-xs italic' }
    b.use :hint, wrap_with: { tag: 'p', class: 'mt-2 text-pink text-xs italic' }
  end

  # vertical input for inline radio buttons and check boxes
  config.wrappers :vertical_collection_inline, item_wrapper_class: 'inline-flex items-center',
                                               item_label_class: 'my-1 ml-3 block text-sm font-medium text-neutral', tag: 'div', class: 'my-4' do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :legend_tag, tag: 'legend', class: 'text-sm font-medium text-neutral', error_class: 'text-error'  do |ba|
      ba.use :label_text
    end
    b.use :input, class: 'focus:ring-2 focus:ring-pink ring-offset-2 h-4 w-4 text-pink border-neutral rounded', error_class: 'text-error', valid_class: 'text-amethyst'
    b.use :full_error, wrap_with: { tag: 'p', class: 'block mt-2 text-error text-xs italic' }
    b.use :hint, wrap_with: { tag: 'p', class: 'mt-2 text-pink text-xs italic' }
  end

  # vertical file input
  config.wrappers :vertical_file, tag: 'div', class: '' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :readonly
    b.use :label, class: 'text-sm font-medium text-pink block', error_class: 'text-error'
    b.use :input, class: 'w-full text-neutral px-3 py-2 border rounded', error_class: 'text-error border-red', valid_class: 'text-amethyst'
    b.use :full_error, wrap_with: { tag: 'p', class: 'mt-2 text-error text-xs italic' }
    b.use :hint, wrap_with: { tag: 'p', class: 'mt-2 text-pink text-xs italic' }
  end

  # vertical select input
  config.wrappers :vertical_select, class: 'mb-3' do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: 'text-sm font-medium text-pink block', error_class: 'text-error'
    b.use :input, class: 'w-full text-neutral px-3 py-2 border rounded', error_class: 'text-error border-red', valid_class: 'text-amethyst'
    b.use :full_error, wrap_with: { tag: 'p', class: 'mt-2 text-error text-xs italic' }
    b.use :hint, wrap_with: { tag: 'p', class: 'mt-2 text-pink text-xs italic' }
  end

  # vertical multi select
  config.wrappers :vertical_multi_select, tag: 'div', class: 'my-4', error_class: 'f', valid_class: '' do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :legend_tag, tag: 'legend', class: 'text-sm font-medium text-pink', error_class: 'text-error' do |ba|
      ba.use :label_text
    end
    b.wrapper tag: 'div', class: 'inline-flex space-x-1' do |ba|
      # ba.use :input, class: 'flex w-auto w-auto text-gray-500 text-sm border-neutral rounded p-2', error_class: 'text-error', valid_class: 'text-green-400'
      ba.use :input, class: 'flex w-auto w-auto shadow appearance-none border border-neutral rounded w-full p-2 bg-white focus:outline-none focus:border-pink text-neutral leading-4 transition-colors duration-200 ease-in-out'
    end
    b.use :full_error, wrap_with: { tag: 'p', class: 'mt-2 text-error text-xs italic' }
    b.use :hint, wrap_with: { tag: 'p', class: 'mt-2 text-pink text-xs italic' }
  end

  # vertical range input
  config.wrappers :vertical_range, tag: 'div', class: 'my-4', error_class: 'text-error', valid_class: 'text-pink' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :readonly
    b.optional :step
    b.use :label, class: 'text-sm font-medium text-neutral block', error_class: 'text-error'
    b.wrapper tag: 'div', class: 'flex items-center h-5' do |ba|
      ba.use :input, class: 'rounded-lg overflow-hidden appearance-none bg-neutral h-3 w-full text-neutral', error_class: 'text-error', valid_class: 'text-pink'
    end
    b.use :full_error, wrap_with: { tag: 'p', class: 'mt-2 text-error text-xs italic' }
    b.use :hint, wrap_with: { tag: 'p', class: 'mt-2 text-pink text-xs italic' }
  end

  # # horizontal forms
  # #
  # # horizontal default_wrapper
  # config.wrappers :horizontal_form, class: 'row mb-3' do |b|
  #   b.use :html5
  #   b.use :placeholder
  #   b.optional :maxlength
  #   b.optional :minlength
  #   b.optional :pattern
  #   b.optional :min_max
  #   b.optional :readonly
  #   b.use :label, class: 'col-sm-3 col-form-label'
  #   b.wrapper :grid_wrapper, class: 'col-sm-9' do |ba|
  #     ba.use :input, class: 'form-control', error_class: 'is-invalid', valid_class: 'is-valid'
  #     ba.use :full_error, wrap_with: { class: 'invalid-feedback' }
  #     ba.use :hint, wrap_with: { class: 'form-text' }
  #   end
  # end

  # # horizontal input for boolean
  # config.wrappers :horizontal_boolean, class: 'row mb-3' do |b|
  #   b.use :html5
  #   b.optional :readonly
  #   b.wrapper :grid_wrapper, class: 'col-sm-9 offset-sm-3' do |wr|
  #     wr.wrapper :form_check_wrapper, class: 'form-check' do |bb|
  #       bb.use :input, class: 'form-check-input', error_class: 'is-invalid', valid_class: 'is-valid'
  #       bb.use :label, class: 'form-check-label'
  #       bb.use :full_error, wrap_with: { class: 'invalid-feedback' }
  #       bb.use :hint, wrap_with: { class: 'form-text' }
  #     end
  #   end
  # end

  # # horizontal input for radio buttons and check boxes
  # config.wrappers :horizontal_collection, item_wrapper_class: 'form-check', item_label_class: 'form-check-label',
  #                                         class: 'row mb-3' do |b|
  #   b.use :html5
  #   b.optional :readonly
  #   b.use :label, class: 'col-sm-3 col-form-label pt-0'
  #   b.wrapper :grid_wrapper, class: 'col-sm-9' do |ba|
  #     ba.use :input, class: 'form-check-input', error_class: 'is-invalid', valid_class: 'is-valid'
  #     ba.use :full_error, wrap_with: { class: 'invalid-feedback d-block' }
  #     ba.use :hint, wrap_with: { class: 'form-text' }
  #   end
  # end

  # # horizontal input for inline radio buttons and check boxes
  # config.wrappers :horizontal_collection_inline, item_wrapper_class: 'form-check form-check-inline',
  #                                                item_label_class: 'form-check-label', class: 'row mb-3' do |b|
  #   b.use :html5
  #   b.optional :readonly
  #   b.use :label, class: 'col-sm-3 col-form-label pt-0'
  #   b.wrapper :grid_wrapper, class: 'col-sm-9' do |ba|
  #     ba.use :input, class: 'form-check-input', error_class: 'is-invalid', valid_class: 'is-valid'
  #     ba.use :full_error, wrap_with: { class: 'invalid-feedback d-block' }
  #     ba.use :hint, wrap_with: { class: 'form-text' }
  #   end
  # end

  # # horizontal file input
  # config.wrappers :horizontal_file, class: 'row mb-3' do |b|
  #   b.use :html5
  #   b.use :placeholder
  #   b.optional :maxlength
  #   b.optional :minlength
  #   b.optional :readonly
  #   b.use :label, class: 'col-sm-3 col-form-label'
  #   b.wrapper :grid_wrapper, class: 'col-sm-9' do |ba|
  #     ba.use :input, class: 'form-control', error_class: 'is-invalid', valid_class: 'is-valid'
  #     ba.use :full_error, wrap_with: { class: 'invalid-feedback' }
  #     ba.use :hint, wrap_with: { class: 'form-text' }
  #   end
  # end

  # # horizontal select input
  # config.wrappers :horizontal_select, class: 'row mb-3' do |b|
  #   b.use :html5
  #   b.optional :readonly
  #   b.use :label, class: 'col-sm-3 col-form-label'
  #   b.wrapper :grid_wrapper, class: 'col-sm-9' do |ba|
  #     ba.use :input, class: 'form-select', error_class: 'is-invalid', valid_class: 'is-valid'
  #     ba.use :full_error, wrap_with: { class: 'invalid-feedback' }
  #     ba.use :hint, wrap_with: { class: 'form-text' }
  #   end
  # end

  # # horizontal multi select
  # config.wrappers :horizontal_multi_select, class: 'row mb-3' do |b|
  #   b.use :html5
  #   b.optional :readonly
  #   b.use :label, class: 'col-sm-3 col-form-label'
  #   b.wrapper :grid_wrapper, class: 'col-sm-9' do |ba|
  #     ba.wrapper class: 'd-flex flex-row justify-content-between align-items-center' do |bb|
  #       bb.use :input, class: 'form-select mx-1', error_class: 'is-invalid', valid_class: 'is-valid'
  #     end
  #     ba.use :full_error, wrap_with: { class: 'invalid-feedback d-block' }
  #     ba.use :hint, wrap_with: { class: 'form-text' }
  #   end
  # end

  # # horizontal range input
  # config.wrappers :horizontal_range, class: 'row mb-3' do |b|
  #   b.use :html5
  #   b.use :placeholder
  #   b.optional :readonly
  #   b.optional :step
  #   b.use :label, class: 'col-sm-3 col-form-label pt-0'
  #   b.wrapper :grid_wrapper, class: 'col-sm-9' do |ba|
  #     ba.use :input, class: 'form-range', error_class: 'is-invalid', valid_class: 'is-valid'
  #     ba.use :full_error, wrap_with: { class: 'invalid-feedback' }
  #     ba.use :hint, wrap_with: { class: 'form-text' }
  #   end
  # end

  # inline forms
  #
  # inline default_wrapper
  config.wrappers :inline_form, tag: 'div', class: 'mb-3' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'visually-hidden'
    b.use :input, class: 'shadow appearance-none border border-neutral rounded w-full py-2 px-3 bg-snow focus:outline-none focus:ring-0 focus:border-purple text-black leading-6 transition-colors duration-200 ease-in-out', error_class: 'border-error', valid_class: 'border-amethyst'
    b.use :full_error, wrap_with: { tag: 'p', class: 'mt-2 text-error text-xs italic' }
    b.use :hint, wrap_with: { tag: 'p', class: 'mt-2 text-pink text-xs italic' }
  end

  # inline input for boolean
  config.wrappers :inline_boolean, tag: 'div', class: 'mb-3' do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper tag: 'div', class: 'flex items-center justify-center' do |ba|
      ba.use :input, class: 'focus:ring-2 focus:ring-pink ring-offset-2 h-4 w-4 text-pink border-neutral rounded'
    end
    b.wrapper tag: 'div', class: 'ml-3 text-sm' do |bb|
      bb.use :label, class: 'block', error_class: 'text-error'
      bb.use :hint, wrap_with: { tag: 'p', class: 'block text-pink text-xs italic' }
      bb.use :full_error, wrap_with: { tag: 'p', class: 'block text-error text-xs italic' }
    end
  end


  # The default wrapper to be used by the FormBuilder.
  config.default_wrapper = :vertical_form

  # Custom wrappers for input types. This should be a hash containing an input
  # type as key and the wrapper that will be used for all inputs with specified type.
  config.wrapper_mappings = {
    boolean: :vertical_boolean,
    check_boxes: :vertical_collection,
    date: :vertical_multi_select,
    datetime: :vertical_multi_select,
    file: :vertical_file,
    radio_buttons: :vertical_collection,
    range: :vertical_range,
    time: :vertical_multi_select,
    select: :vertical_select,
    multi_select: :vertical_multi_select,
    text: :vertical_form_with_div
  }
end
