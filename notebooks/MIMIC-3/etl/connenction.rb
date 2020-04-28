require 'sequel'
Object.send(:remove_const, :DB_MIMIC) if defined? (DB_MIMIC)
DB_MIMIC = Sequel.connect(adapter: 'postgres',
                          host: 'postgres',
                          user: 'postgres',
                          password: 'password',
                          database: 'mimic3_demo',
                          search_path: ['mimiciii']
                          )