# Instructions

Once you clone the repository you need to follow the next step:

* Run rails db:migrate to load all the models.

* If you want to modify the currencies from the seed you need to modify at the end of the seed otherwise the currencies that will be created are the following ```['EUR', 'USD', 'ARS', 'UYU']```. You could add currencies by console as well.

**NOTE**: You need to keep the 'EUR' as the first currency.

* Run rails db:seed to load the currencies.
## API FIXER.IO

* Rename the .env_example to .env and update the variable access_key with your own key from fixer.io (it's case sensitive so copy and paste the key you were given by the API).
* Run ```rails fetch_currencies:hourly``` to load the current currencies values, if you want to update it every hour uncomment the loop.

## USER create/login/signout
* Create Users using the console or you could use endpoint POST /auth to register a user, in the form-data from the **Body** you should add email, password, password_confirmation.

**NOTE**: If you use the endpoint, the user will log in automatically.

* To log in an account you should use the endpoint POST /auth/sign_in, you should add on the form-data from the **Body**, the email and password as parameters. On the **Header**'s results you will see access-token, token-type, client, expiry, and ui. Depending which endpoint you use, you may need some of these.

* To sign out an account in the form-data from the **Body** you should add email and password as parameters. And on the **Params** section you should add access-token, client, and uid from the user is logged in.

## Bank Account

* Create bank accounts using the console, you need to add some cash on the attribute 'cash' otherwise it will be created with 0 cash, the user_id will be the account's owner and currency_id will be the account's currency

To make a transfer between two accounts, you need to log in before do this. you have the endpoint POST /transferir. On the **Header**'s params you have to add access-token, uid, client from the user who logged in. In the **Body**'s params you should add account_from (id from bank account where you want to transfer), account_to (id from bank account where you want to send money), amount (cash to send), and description (text to send) as parameters.

To see all transactions one user did you need to log in before you can see the transactions. After that you have the endpoint GET /transacciones, you should add on the **Header**'s params the access-token, uid, client that you got from the login. If you want to see between specific dates, you can add as in the section **Params** these two params; start_date, end_date. Both of them as datetime YYYY-MM-DD HH:MM:DD. If you don't add HH:MM:DD, it takes the beginning of day

# Heroku instructions

The previous steps are for Heroku as well but the endpoint from the url is https://api-transacciones-bancarias.herokuapp.com instead of localhost. If you need to use the console use ```heroku run rails console``` on the terminal from project cloned.

## SEED

The seed is already loaded with the currencies above. ```['EUR', 'USD', 'ARS', 'UYU']```. So use the console to create new ones.

## API FIXER.IO

* To fetch currencies values you have to run ```heroku run rake fetch_currencies:hourly```
