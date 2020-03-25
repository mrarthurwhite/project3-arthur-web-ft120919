# README

* Ruby version
    * // ♥  ruby -version
ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-linux]


* Database creation
    * sqllite 3 with migrations
    * rails g model registration rsvp:string comment:string user:belongs_to event:belongs_to --skip-routes --no-helper --no-assets --no-javascripts --no-stylesheets --no-test-framework
    * rails g resource Event title:string location:string description:text meeting_datetime:datetime user:belongs_to --no-test-framework --no-javascripts --no-assets --no-stylesheets  
    * rails g resource User name:string email:string --no-test-framework --no-javascripts --no-assets --no-stylesheets


* Database initialization
    * Used , rails g new 

