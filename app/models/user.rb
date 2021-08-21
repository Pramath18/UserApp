class User
  include Mongoid::Document
  
  field :firstname, type: String
  field :lastname, type: String
  field :email, type: String

  include PgSearch
  pg_search_scope :search, against: [:firstname,:lastname,:email],
    using: {
      tsearch: {
        any_word: true,
        prefix: true
      }
    }

end
