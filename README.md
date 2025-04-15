# えびちゅう聖地巡礼マップ  
[![Image from Gyazo](https://i.gyazo.com/5d05ad52c52c36eae2310111260b21ae.jpg)](https://gyazo.com/5d05ad52c52c36eae2310111260b21ae)
  
## 目次  
- [サイトURL](#サイトurl)  
- [サービス概要](#サービス概要)  
- [このサービスへの思い・作りたい理由](#このサービスへの思い作りたい理由)  
- [ユーザー層について](#ユーザー層について)  
- [サービスの利用イメージ](#サービスの利用イメージ)  
- [ユーザーの獲得について](#ユーザーの獲得について)  
- [サービスの差別化ポイント・推しポイント](#サービスの差別化ポイント推しポイント)  
- [主な機能一覧](#主な機能一覧)  
- [技術スタック](#技術スタック)  
- [補足資料](#補足資料)  
   
## ■サイトURL  
[https://ebc-sanctuary-map-7d9303cf86fb.herokuapp.com/](https://ebc-sanctuary-map-7d9303cf86fb.herokuapp.com/)  
  
## ■サービス概要  
えびちゅう聖地巡礼マップは、スターダストプロモーション所属のアイドルグループ「私立恵比寿中学（通称：えびちゅう）」のファンのために作られた聖地巡礼マップです。
このサービスでは、えびちゅうが訪れたスポットをファンが地図上に投稿し、共有することができます。   
  
## ■このサービスへの思い・作りたい理由  
私立恵比寿中学は、2009年にスターダストプロモーションによって結成された、日本の女性アイドルグループです。彼女たちは「永遠に中学生」というコンセプトを掲げ、私たちファンの心を魅了してきました。
私たちは、彼女たちが歩んできた歴史や、ファン同士の絆を大切にしています。  
2024年には私立恵比寿中学が結成してから15周年を迎えます。
彼女たちの活動の軌跡には、本当に感慨深いものを感じます。  
そして、彼女たちの足跡をたどり、ファンが集い、交流する場を提供したいという思いから、このサービスを作りました。  
最近では、推しのメンバーが訪れた場所で同じ角度で写真を撮ることが流行しています。  
しかし、そのためには個々で情報を調べる必要があり、手間がかかります。そこで、彼女たちの聖地をマップ上にまとめ、ファンみんなで情報を共有し合えるサービスを提供したいと考えました。  
新旧のファンが交流し、彼女たちの聖地を共有することで、ますますえびちゅうコミュニティを盛り上げていきます。  
  
  
## ■ユーザー層について  
ユーザー層: 私立恵比寿中学のファン（通称：ファミリー）  
理由: 聖地巡礼マップを通じて、彼女たちの足跡を追い、共感と絆を深めるため  
  
  
## ■サービスの利用イメージ  
**投稿**:
     自分が訪れたエビチュウの聖地やスポットを写真とともに投稿する。    
**検索**:
     地名やキーワードから全国の聖地を検索し、他のファンが投稿した場所を見つける。    
**閲覧**:
     投稿された聖地を閲覧し、他のファンの体験や写真を楽しむ。    
  
  
## ■ユーザーの獲得について   
TwitterやInstagram等のSNSでサービスの利用を呼びかける。  
  
  
## ■サービスの差別化ポイント・推しポイント  
* 同様のサービスが存在しないため、先行者利益を活かして市場シェアを獲得。  
* ユーザー投稿による独自の情報が集まり、ここでしか得られないコンテンツが形成される。​    
* 検索機能により、自分の居住地域に聖地があるかを簡単に調べられる。  
  
  
## ■主な機能一覧  
#### **基本機能**  
* ユーザー登録・ログイン・プロフィール編集​
* 聖地の投稿（写真・位置情報・コメント）​  
* 聖地の検索（地名・キーワード）​  
* 投稿一覧表示​  
* いいね機能​  
* コメント機能  
* タグ機能
* 画像加工（トリミング）​  
* 地図表示（Google Maps API)  
#### **その他**  
* 利用規約​  
* プライバシーポリシー  
* パスワードリセット  
* お問い合わせ  
  
  
  
## ■技術スタック  
* **言語・フレームワーク**: Ruby / Ruby on Rails​  
* **ホスティング**: Heroku  
* **データベース**: PostgreSQL​  
* **画像アップロード・加工**: Cloudinary   
* **メール送信**: Twilio SendGrid  
* **外部API**: Google Maps API（地図機能）​  
* **ソースコード管理**: Git / GitHub​  
  
  
## ■補足資料  
* **画面遷移図**  

https://www.figma.com/file/iS2tpjzHg4M4v8AKD3Yj3q/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3%EF%BC%88%E8%81%96%E5%9C%B0%E5%B7%A1%E7%A4%BC%E3%83%9E%E3%83%83%E3%83%97%EF%BC%89?type=design&mode=design&t=RuIpIpIWXSIpMdWw-0  
  
    
* **ER図**  
![app](https://github.com/denryuuu/newproject/assets/138588277/40b6e359-9d16-41cf-99e2-02ad3167d8b3)  

