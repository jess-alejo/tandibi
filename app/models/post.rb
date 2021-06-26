# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  postable_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  postable_id   :bigint           not null
#  thread_id     :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_posts_on_postable   (postable_type,postable_id)
#  index_posts_on_thread_id  (thread_id)
#  index_posts_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (thread_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user
  belongs_to :thread
  belongs_to :postable, polymorphic: true
end