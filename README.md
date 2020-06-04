# MySQLdotEnv

[![Software License][ico-license]](LICENSE.md)

When you work with Symfony and got tired of checking database user/pass in env files just to connect to mysql on test servers...

This bash script will search for provided env file in given location and try to connect to mysql database using `DATABASE_URL=` connection string.

Remember: DO NOT USE THIS SCRIPT ON PRODUCTION SERVERS! DO NOT PUT THIS SCRIPT INSIDE WEB FOLDERS!

## Usage

``` bash
./mysql-dotenv.sh ./path-to/your.dotenv-file/.env
```

## Credits

- [johnykvsky][link-author]

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.

[ico-license]: https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square
[link-author]: https://github.com/johnykvsky
