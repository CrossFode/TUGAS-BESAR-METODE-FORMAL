sig Text {}
sig EncryptedText {}

sig Pembaca {
  id: one Text,
  email: one Text,
  subscribedGenres: set Text,
  totalSpent: Int
}

sig Komik {
  judul: Text,
  genre: Text,
}

sig Pembayaran {
  metodePembayaran: Text,
  jumlah: Int,
}

sig Subscription {
  pembaca: one Pembaca,
  komik: one Komik,
  totalDays: Int
}

// Predicates

pred SufficientFunds[p: Pembayaran] {
  p.jumlah >= 0
}

pred ReaderHasSubscription[r: Pembaca, c: Komik] {
  some r.id & c.judul
}

pred KomikHasGenre[k: Komik, g: Text] {
  k.genre = g
}

pred PembacaHasSpentEnough[p: Pembayaran, r: Pembaca] {
  r.totalSpent >= p.jumlah
}

// Assertion
assert AtLeastOneReaderHasSubscription {
  some r: Pembaca, c: Komik | ReaderHasSubscription[r, c]
}

run {} for 5










