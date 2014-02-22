require_relative 'find_bad_emails'
require_relative 'email'

# c=FindBadEmails.new('to_search.csv')
# results = c.read_file

results = ['sonny@aol.com', 'this-grammy@yahoo.com', 'towel@towel', 'penis@gmail.com', 'abcdéf@híjklmn.cØm', 'abcdééf@híjéklémn.cØm']

if results.any?
  results.each do |email|
    user_email = Email.new(email)
    user_email.validate_email
    user_email.display_errors
  end
end
