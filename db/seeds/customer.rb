  Customer.create!(
    [
      {
      	id: 1,
      	email: 'a@com',
      	last_name: '中島', first_name: '伊織里',
      	last_name_kana: 'ナカシマ', first_name_kana: 'イオリ',
      	postal_code: '0000000',
      	address: '大阪府大阪市難波ウェブキャンプ000-000',
      	phone_number: '09011119999',
      	customer_status: true,
      	password: 'aaaaaa',
      	password_confirmation: 'aaaaaa',
      },

      {
        id: 2,
        email: '1@com',
        last_name: '焼肉', first_name: '肉食',
        last_name_kana: 'ヤキニク', first_name_kana: 'キンニク',
        postal_code: '0000000',
        address: '大阪府大阪市難波ウェブキャンプ888999',
        phone_number: '09074747999',
        customer_status: true,
        password: '111111',
        password_confirmation: '111111',
      },
    ])