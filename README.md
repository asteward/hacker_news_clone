#Hacker News Clone
###Authored by Austin Steward
***
##Description
This rails web app uses four models (`User`, `Post`, `Comment` & `Vote`). A `User` may create a `Post`, `Comment` on a `Post`, and `Vote` on a `Post`. Essentially, `Comment` and `Vote` are join tables for `User` and `Post`.
Posts are listed by number of `User` votes from greatest to least.
Authentication is used, and anyone may sign up for a `User` account. Only logged-in users may create posts, and comment or vote on a post. Non-users may only create an account, view all posts, and read post comments. Authentication redirects non-users to the log-in page if they attempt to do anything other than these three actions.
`Capybara` integration tests were implemented to test site, along with `Rspec` model tests.

***
##Dependencies
- [Bootstrap](http://getbootstrap.com/)
- [Bootstrap.min.js](http://getbootstrap.com/javascript/)
- [jQuery](http://jquery.com/)
- [Sass](http://sass-lang.com/)

***
##Licensing
- [MIT](http://opensource.org/licenses/MIT)
