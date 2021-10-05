class Genre < ActiveHash::Base
  include ActiveHash::Associations
  has_many :reviews

  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'アクション' },
    { id: 3, name: 'SF' },
    { id: 4, name: 'ホラー' },
    { id: 5, name: 'サスペンス' },
    { id: 6, name: 'ミステリー' },
    { id: 7, name: '恋愛' },
    { id: 8, name: '戦争' },
    { id: 9, name: 'コメディ' },
    { id: 10, name: 'ミュージカル' },
    { id: 11, name: 'ファミリー' },
    { id: 12, name: 'アドベンチャー' },
    { id: 13, name: '歴史' },
    { id: 14, name: '青春' },
    { id: 15, name: 'その他' },
  ]
end