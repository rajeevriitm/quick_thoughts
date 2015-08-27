class Thought < ActiveRecord::Base
  belongs_to :user
  has_many :responses, dependent: :destroy
  has_many :response_thoughts, through: :responses, source: :resp
  has_many :tags, through: :additions, source: :resp
  default_scope -> { order(created_at: :desc) }
  validates :user_id,presence: true
  validates :content,presence: true
  validates :title,length: {maximum: 250}
  validates :category, presence: true

  def add_tags(tag_list)
    list=tag_list.split(",").map(&:to_i)
    if list.empty?
      return true if self.save
    else
      list.each do |tag|
        return false unless (Thought.exists?(tag) && self.save)
        # raise
        Response.create(thought_id: tag,resp_id: self.id)
      end
    end
  end

end
