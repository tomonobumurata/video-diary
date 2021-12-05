class Place < ActiveHash::Base
  include ActiveHash::Associations
  has_many :reviews

  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '映画館' },
    { id: 3, name: 'TV' },
    { id: 4, name: 'Netflix' },
    { id: 5, name: 'Amazon prime' },
    { id: 6, name: 'U-NEXT' },
    { id: 7, name: 'hulu' },
    { id: 8, name: 'FOD' },
    { id: 9, name: 'Paravi' },
    { id: 10, name: 'TELASA' },
    { id: 11, name: 'Disney＋' },
    { id: 12, name: 'dTV ' },
    { id: 13, name: 'DVD/ブルーレイ/VHS' },
    { id: 14, name: '飛行機' },
    { id: 15, name: 'その他' },
  ]
end