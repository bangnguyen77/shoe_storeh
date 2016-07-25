#Shoe Stores

This app will let users add, update, delete a shoes store or a shoes brand.

##Author

Bang Nguyen

##Install

In your yml file will be :

```ruby
development:
adapter: postgresql
database: shoes_stores

test:
adapter: postgresql
database: shoes_stores_test
```

Then

Run ```rake db:create```
then: ```rake db:migrate```
then:  ```rake db:test:prepare```

This will create the main and test databases.
