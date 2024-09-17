class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.ransackable_attributes(auth_object = nil)
    %w[title content created_at updated_at location_name address user_id] # titleとcontentが検索可能か確認
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user comments] # 関連テーブルも検索に含む場合は定義
  end
end
