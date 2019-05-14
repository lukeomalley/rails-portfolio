# frozen_string_literal: true

class Blog < ApplicationRecord
  # setup for draft and pulbish modes.  From here on we can reference them as "draft" and "publish" rather than 0 and 1
  enum status: { draft: 0, published: 1 }

  # setup for friendly id slug urls
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body
end
