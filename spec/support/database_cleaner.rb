RSpec.configure do |config|
    config.before(:suite) do
        DatabaseCleaner.clean_with :truncation, except: %w[ar_internal_metadata]

        Rails.application.load_seed # loading seeds
    end

    config.before(:each) do
        DatabaseCleaner.strategy = :transaction

        Rails.application.load_seed # loading seeds
    end

    config.before(:each) do
        DatabaseCleaner.start

        Rails.application.load_seed # loading seeds
    end

    config.after(:each) do
        DatabaseCleaner.clean

        Rails.application.load_seed # loading seeds
    end
end
