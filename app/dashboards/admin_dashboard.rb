require "administrate/base_dashboard"

class AdminDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    school: Field::HasOne,
    teachers: Field::HasMany,
    students: Field::HasMany,
    id: Field::Number,
    type: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    school_id: Field::Number,
    teacher_id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    code: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    school
    teachers
    students
    id
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    school
    teachers
    students
    id
    type
    first_name
    last_name
    created_at
    updated_at
    school_id
    teacher_id
    email
    encrypted_password
    reset_password_token
    reset_password_sent_at
    remember_created_at
    code
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    school
    teachers
    students
    type
    first_name
    last_name
    school_id
    teacher_id
    email
    encrypted_password
    reset_password_token
    reset_password_sent_at
    remember_created_at
    code
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how admins are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(admin)
  #   "Admin ##{admin.id}"
  # end
end
