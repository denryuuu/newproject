module PostsHelper
    def tag_class(tag_name)
      case tag_name
      when "ライブ会場" then "tag-live"
      when "MV撮影地" then "tag-mv"
      when "メンバーゆかりの地" then "tag-member"
      when "イベント開催地" then "tag-event"
      else "tag-default" # デフォルトの色
      end
    end
  end