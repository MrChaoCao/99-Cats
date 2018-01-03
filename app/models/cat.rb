# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#



class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  CAT_COLORS = ['black', 'white', 'orange', 'brown', 'gray', 'blue', 'calico']

  validates :color, inclusion: { in: CAT_COLORS }, presence: true
  validates :sex, inclusion: { in: ['M', 'F'] }, presence: true
  validates :birth_date, :name, :description, presence: true



  def age
    time_ago_in_words(birth_date)
  end


end
