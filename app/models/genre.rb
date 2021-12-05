class Genre < ActiveHash::Base
  include ActiveHash::Associations
  has_many :reviews

  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'アニメ' },
    { id: 3, name: 'ドラマ' },
    { id: 4, name: 'アクション' },
    { id: 5, name: 'SF' },
    { id: 6, name: 'ホラー' },
    { id: 7, name: 'サスペンス' },
    { id: 8, name: 'ミステリー' },
    { id: 9, name: '恋愛' },
    { id: 10, name: '戦争' },
    { id: 11, name: 'コメディ' },
    { id: 12, name: 'ミュージカル' },
    { id: 13, name: 'ファミリー' },
    { id: 14, name: 'アドベンチャー' },
    { id: 15, name: 'ファンタジー' },
    { id: 16, name: '歴史' },
    { id: 17, name: '青春' },
    { id: 18, name: 'その他' },
  ]
end