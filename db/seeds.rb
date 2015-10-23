Admin.create(
  email: 'dev@luckiemail.com',
  first_name: 'Luckie',
  last_name: 'Developer',
  password: 'Luckie123',
  password_confirmation: 'Luckie123'
  ) unless Admin.find_by_email('dev@luckiemail.com')