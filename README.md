Accounts
=======

# User API

Make a POST to `/users.json` with the following JSON data structure:

```
{
  user: {
    name:                  'a name',
    email:                 'a_valid@email.com',
    password:              '123123123',
    password_confirmation: '123123123'
  }
}
```
You will get a response like this:

```
{
  user: {
    id: '1',
    name: 'a name',
    email: 'a_valid@email.com',
    authentication_token: 'a_long_and_secure_token'
  }
}
```

Of course, an user will be saved with this data.

